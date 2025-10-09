  */
    it('SetForEachTest061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest061();

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(true);
      expect(result[2]).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6200
     * @tc.name SetForEachTest062
     * @tc.desc forEach() called on a Set in a detached iframe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6300
     * @tc.name SetForEachTest063
     * @tc.desc Callback that throws and catches its own error
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      const visited: number[] = [];
      const errors: Error[] = [];

      const callback = (value: number) => {
        visited.push(value);
        try {
          if (value === 2) {
            throw new Error('Expected error');
          }
        } catch (e) {
          errors.push(e);
        }
      };

      set.forEach(callback);

      expect(visited).assertDeepEquals([1, 2, 3]);
      expect(errors.length).assertEqual(1);
      expect(errors[0].message).assertEqual('Expected error');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6400
     * @tc.name SetForEachTest064
     * @tc.desc Set with elements that are revoked proxies
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest064()).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6500
     * @tc.name SetForEachTest065
     * @tc.desc forEach() with a very large thisArg object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest065()).assertEqual(25);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6600
     * @tc.name SetForEachTest066
     * @tc.desc Traverse Set during concurrent modification in another function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3, 4, 5]);
      const visited: number[] = [];
      let modificationComplete = false;

      const modifySet = () => {
        setTimeout(() => {
          set.add(6);
          set.delete(3);
          modificationComplete = true;
        }, 0);
      };

      modifySet();
      set.forEach(value => visited.push(value));

      while (!modificationComplete) {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
      }

      expect(visited.includes(1)).assertEqual(true);
      expect(visited.includes(6)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6700
     * @tc.name SetForEachTest067
     * @tc.desc Callback that is a generator function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest067()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6800
     * @tc.name SetForEachTest068
     * @tc.desc forEach() on a Set with prototype modified
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest068()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_6900
     * @tc.name SetForEachTest069
     * @tc.desc Set containing non-primitive values with custom toString
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        value: string,
        toString: () => string;
      }

      const obj1 = {
        value: 'a',
        toString: () => 'custom-a'
      } as BaseI;
      const obj2 = {
        value: 'b',
        toString: () => 'custom-b'
      } as BaseI;
      const set = new Set([obj1, obj2]);
      const visited: string[] = [];

      set.forEach(value => {
        visited.push(value.toString());
      });

      expect(visited).assertDeepEquals(['custom-a', 'custom-b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7000
     * @tc.name SetForEachTest070
     * @tc.desc forEach() with thisArg as a null prototype object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest070()).assertEqual(15);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7100
     * @tc.name SetForEachTest071
     * @tc.desc Set with elements that are weak references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      if (typeof WeakRef === 'undefined') {
        return;
      }

      interface BaseI {}

      const obj = {} as BaseI;
      const weakRef = new WeakRef(obj);
      const set = new Set([weakRef]);
      const visited: (BaseI | undefined)[] = [];

      set.forEach(ref => visited.push(ref.deref()));

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7200
     * @tc.name SetForEachTest072
     * @tc.desc forEach() called with Reflect.apply
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const visited: number[] = [];
      const callback = (value: number) => visited.push(value);

      SetForEachTest072(set, callback);

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7300
     * @tc.name SetForEachTest073
     * @tc.desc Callback that recursively calls forEach on the same Set
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1]);
      let callCount = 0;
      let recursionDepth = 0;

      const callback = () => {
        callCount++;
        recursionDepth++;
        if (recursionDepth < 3) {
          set.forEach(callback);
        }
        recursionDepth--;
      };

      set.forEach(callback);

      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7400
     * @tc.name SetForEachTest074
     * @tc.desc Set with elements that are all the same object reference
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        id: number
      }

      const obj = { id: 1 } as BaseI;
      const set = new Set([obj, obj, obj]);
      const visited: BaseI[] = [];

      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(1);
      expect(visited[0]).assertEqual(obj);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7500
     * @tc.name SetForEachTest075
     * @tc.desc forEach() with a callback that's a class constructor
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest075() as number[];

      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7700
     * @tc.name SetForEachTest077
     * @tc.desc forEach() on a Set that's been made non-extensible
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      SetForEachTest077(set);

      const visited: number[] = [];
      set.forEach(value => visited.push(value));

      expect(visited).assertDeepEquals([1, 2]);
      expect(SetForEachTest0771(set)).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7800
     * @tc.name SetForEachTest078
     * @tc.desc Callback that modifies the Set's prototype during traversal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest078()).assertDeepEquals([1, 2, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_7900
     * @tc.name SetForEachTest079
     * @tc.desc Set with elements that are DataView objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer1 = new ArrayBuffer(4);
      const buffer2 = new ArrayBuffer(4);
      const view1 = new DataView(buffer1);
      const view2 = new DataView(buffer2);

      view1.setInt32(0, 123);
      view2.setInt32(0, 123);

      const set = new Set([view1, view2]);
      const visited: number[] = [];

      set.forEach(view => visited.push(view.getInt32(0)));

      expect(visited).assertDeepEquals([123, 123]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8000
     * @tc.name SetForEachTest080
     * @tc.desc forEach() with thisArg as a Symbol
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest080()).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8100
     * @tc.name SetForEachTest081
     * @tc.desc Set containing SharedArrayBuffer objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      if (typeof SharedArrayBuffer === 'undefined') {
        return;
      }

      const sab1 = new SharedArrayBuffer(8);
      const sab2 = new SharedArrayBuffer(8);
      const set = new Set([sab1, sab2]);
      const visited: number[] = [];

      set.forEach(sab => visited.push(sab.byteLength));

      expect(visited).assertDeepEquals([8, 8]);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8200
     * @tc.name SetForEachTest082
     * @tc.desc forEach() called in a Web Worker-like context
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest082()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8300
     * @tc.name SetForEachTest083
     * @tc.desc Callback that uses eval() to modify behavior
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest083()).assertDeepEquals([1, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8400
     * @tc.name SetForEachTest084
     * @tc.desc Set with elements that are error objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const error1 = new Error('Error 1');
      const error2 = new Error('Error 2');
      const set = new Set([error1, error2, error1]);
      const visited: string[] = [];

      set.forEach(err => visited.push(err.message));

      expect(visited).assertDeepEquals(['Error 1', 'Error 2']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8500
     * @tc.name SetForEachTest085
     * @tc.desc forEach() with callback that's a Proxy to a function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest085()).assertDeepEquals([2, 4]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8600
     * @tc.name SetForEachTest086
     * @tc.desc Set containing both NaN and other numeric values
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([NaN, 1, NaN, 2, NaN]);
      const visited: number[] = [];

      set.forEach(value => visited.push(value));

      expect(visited.length).assertEqual(3);
      expect(Number.isNaN(visited[0])).assertEqual(true);
      expect(visited[1]).assertEqual(1);
      expect(visited[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8700
     * @tc.name SetForEachTest087
     * @tc.desc forEach() called on a Set with overridden forEach method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest087()).assertDeepEquals([99]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8800
     * @tc.name SetForEachTest088
     * @tc.desc Callback that uses the 'arguments' object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a']);
      let argsLog = SetForEachTest088(set) as (string | Set<string>)[] | null;

      expect(argsLog!.length).assertEqual(3);
      expect(argsLog![0]).assertEqual('a');
      expect(argsLog![1]).assertEqual('a');
      expect(argsLog![2]).assertEqual(set);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_8900
     * @tc.name SetForEachTest089
     * @tc.desc Set with elements that are DOM element-like objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        tagName: string,
        id: string
      }

      const elem1 = { tagName: 'DIV', id: 'a' } as BaseI;
      const elem2 = { tagName: 'SPAN', id: 'b' } as BaseI;
      const set = new Set([elem1, elem2]);
      const visited: string[] = [];

      set.forEach(elem => {
        visited.push(`${elem.tagName}:${elem.id}`);
      });

      expect(visited).assertDeepEquals(['DIV:a', 'SPAN:b']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9000
     * @tc.name SetForEachTest090
     * @tc.desc forEach() with thisArg as a BigInt primitive
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([2n]);
      expect(SetForEachTest090(set)).assertEqual(6n);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9100
     * @tc.name SetForEachTest091
     * @tc.desc Set containing Int32Array views of the same buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(8);
      const view1 = new Int32Array(buffer, 0, 2);
      const view2 = new Int32Array(buffer, 4, 1);
      const set = new Set([view1, view2]);
      const visited: number[][] = [];

      view1[0] = 10;
      view1[1] = 20;
      view2[0] = 30;

      set.forEach(view => visited.push(Array.from(view)));

      expect(visited).assertDeepEquals([[10, 30], [30]]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9200
     * @tc.name SetForEachTest092
     * @tc.desc forEach() in a strict mode function
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      'use strict';

      const set = new Set([1, 2]);
      const visited: number[] = [];

      const callback = (value: number) => {
        visited.push(value);
      };

      set.forEach(callback);

      expect(visited).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9300
     * @tc.name SetForEachTest093
     * @tc.desc Callback that modifies a closed-over variable in outer scope
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      let outerVar = 0;

      const createCallback = () => {
        return (value: number) => {
          outerVar += value;
        };
      };

      set.forEach(createCallback());

      expect(outerVar).assertEqual(6);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9400
     * @tc.name SetForEachTest094
     * @tc.desc Set with elements that are regex objects with same pattern
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const regex1 = /pattern/;
      const regex2 = /pattern/;
      const set = new Set([regex1, regex2]);
      const visited: string[] = [];

      set.forEach(regex => visited.push(regex.source));

      expect(visited).assertDeepEquals(['pattern', 'pattern']);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9500
     * @tc.name SetForEachTest095
     * @tc.desc forEach() with callback that's a bound function with arguments
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([10, 20]);
      const results = SetForEachTest095(set) as number[];

      expect(results).assertDeepEquals([100 + (5 * 10), 100 + (5 * 20)]);
      expect(results).assertDeepEquals([150, 200]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9600
     * @tc.name SetForEachTest096
     * @tc.desc Set containing both primitives and their object wrappers
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const numPrimitive = 123;
      const numObject = new Number(123);
      const strPrimitive = 'test';
      const strObject = new String('test');

      const set = new Set([numPrimitive, numObject, strPrimitive, strObject]);

      interface BaseI {
        value: string | number,
        type: string
      }

      const visited: BaseI[] = [];

      set.forEach(value => {
        visited.push({ value: value.valueOf(), type: typeof value });
      });

      expect(visited.length).assertEqual(4);
      expect(visited[0].value).assertEqual(123);
      expect(visited[0].type).assertEqual('number');
      expect(visited[1].value).assertEqual(123);
      expect(visited[1].type).assertEqual('object');
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9700
     * @tc.name SetForEachTest097
     * @tc.desc forEach() called on a Set with a modified 'add' method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set<number>();
      expect(SetForEachTest097(set)).assertDeepEquals([4, 9]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9800
     * @tc.name SetForEachTest098
     * @tc.desc Callback that uses 'this' from multiple nested functions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest098()).assertEqual(10);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_9900
     * @tc.name SetForEachTest099
     * @tc.desc Set with elements that are generator objects
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest099()).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10000
     * @tc.name SetForEachTest100
     * @tc.desc Comprehensive final test with mixed scenarios
     * @tc.size LargeTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest100', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL4, async () => {
      const result = SetForEachTest100();
      expect(result[0]).assertEqual(14);
      expect(result[1]).assertEqual(14);
      expect(result[2]).assertEqual(42);
      expect(result[3]).assertEqual(true);
      expect(result[4]).assertEqual('modified');
      expect(result[5]).assertEqual(true);
      expect(result[6]).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10100
     * @tc.name SetForEachTest101
     * @tc.desc Traverse Set with elements that are WeakMap instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {}

      const wm1 = new WeakMap<BaseI, string>();
      const wm2 = new WeakMap<BaseI, string>();
      const key1 = {} as BaseI;
      const key2 = {} as BaseI;
      wm1.set(key1, 'value1');
      wm2.set(key2, 'value2');
      const set = new Set([wm1, wm2]);
      const visited: string[] = [];

      set.forEach(wm => {
        if (wm.has(key1)) {
          visited.push(wm.get(key1) as string);
        }
        if (wm.has(key2)) {
          visited.push(wm.get(key2) as string);
        }
      });

      expect(visited).assertDeepEquals(['value1', 'value2']);
      expect(visited.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10200
     * @tc.name SetForEachTest102
     * @tc.desc forEach() with callback that uses Function.prototype.call to change 'this'
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest102()).assertDeepEquals([30, 60]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10300
     * @tc.name SetForEachTest103
     * @tc.desc Set containing objects with custom valueOf methods
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        value: number;
        valueOf: () => number;
      }

      const obj1 = {
        value: 5,
        valueOf: () => {
          return obj1.value * 2;
        }
      } as BaseI;
      const obj2 = {
        value: 3,
        valueOf: () => {
          return obj2.value * 3;
        }
      } as BaseI;
      const set = new Set([obj1, obj2]);
      const visited: number[] = [];

      set.forEach(value => {
        visited.push(value.valueOf() as number);
      });

      expect(visited).assertDeepEquals([10, 9]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10400
     * @tc.name SetForEachTest104
     * @tc.desc forEach() called on a Set with a modified 'delete' method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const result = SetForEachTest104();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertDeepEquals([1, 3]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10600
     * @tc.name SetForEachTest106
     * @tc.desc Callback that uses Promise within forEach (no await)
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2]);
      const immediateResults: number[] = [];
      const asyncResults: number[] = [];

      set.forEach(value => {
        immediateResults.push(value);
        Promise.resolve().then(() => {
          asyncResults.push(value);
        });
      });

      expect(immediateResults).assertDeepEquals([1, 2]);
      expect(asyncResults).assertDeepEquals([]);

      await new Promise<number>(resolve => setTimeout(resolve, 0));
      expect(asyncResults).assertDeepEquals([1, 2]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10700
     * @tc.name SetForEachTest107
     * @tc.desc Set containing objects with circular references
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        self?: BaseI
      }

      const obj = {} as BaseI;
      obj.self = obj;
      const set = new Set([obj]);
      const visited: boolean[] = [];

      set.forEach(value => {
        visited.push(value.self === value);
      });

      expect(visited).assertDeepEquals([true]);
      expect(visited.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10800
     * @tc.name SetForEachTest108
     * @tc.desc forEach() with callback that is a class method
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class Processor {
        private multiplier: number;
        results: number[];

        constructor(multiplier: number) {
          this.multiplier = multiplier;
          this.results = [];
        }

        process(value: number) {
          this.results.push(value * this.multiplier);
        }
      }

      const processor = new Processor(5);
      const set = new Set([2, 3]);

      set.forEach(processor.process.bind(processor));

      expect(processor.results).assertDeepEquals([10, 15]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_10900
     * @tc.name SetForEachTest109
     * @tc.desc Traverse Set with elements that are ArrayBuffer views of different types
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(4);
      const intView = new Int32Array(buffer);
      const uintView = new Uint32Array(buffer);
      const floatView = new Float32Array(buffer);

      intView[0] = -1;
      const set = new Set([intView, uintView, floatView]);
      const visited: number[] = [];

      set.forEach(view => {
        visited.push(view[0]);
      });

      expect(visited[0]).assertEqual(-1);
      expect(visited[1]).assertEqual(4294967295);
      expect(visited.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11000
     * @tc.name SetForEachTest110
     * @tc.desc forEach() with thisArg as a frozen object
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest110()).assertDeepEquals([12, 20]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11100
     * @tc.name SetForEachTest111
     * @tc.desc forEach() with callback that uses optional chaining on elements
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        prop: string
      }

      const set = new Set([{ prop: 'a' } as BaseI, null, { prop: 'b' }, undefined]);
      const results: (string | undefined)[] = [];

      set.forEach(item => {
        results.push(item?.prop);
      });

      expect(results).assertDeepEquals(['a', undefined, 'b', undefined]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11200
     * @tc.name SetForEachTest112
     * @tc.desc Traverse Set with elements that are class instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      class Item {
        public id: number;

        constructor(id: number) {
          this.id = id;
        }

        getIdentifier() {
          return `item-${this.id}`;
        }
      }

      const set = new Set([new Item(1), new Item(2), new Item(1)]);
      const identifiers: string[] = [];

      set.forEach(item => {
        identifiers.push(item.getIdentifier());
      });

      expect(identifiers).assertDeepEquals(['item-1', 'item-2', "item-1"]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11300
     * @tc.name SetForEachTest113
     * @tc.desc forEach() with callback that uses nullish coalescing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([0, '', null, undefined, 42, 'hello']);
      const results: (string | number)[] = [];

      set.forEach(value => {
        results.push(value ?? 'default');
      });

      expect(results).assertDeepEquals([0, '', 'default', 'default', 42, 'hello']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11400
     * @tc.name SetForEachTest114
     * @tc.desc Set containing elements with Symbol properties
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest114()).assertDeepEquals(['value1', 'value2']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11500
     * @tc.name SetForEachTest115
     * @tc.desc forEach() with async callback using await
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set([1, 2, 3]);
      const results: number[] = [];

      const processValue = async (value: number) => {
        await new Promise<number>(resolve => setTimeout(resolve, 10));
        return value * 2;
      };

      const promises: Promise<void>[] = [];
      set.forEach(value => {
        promises.push((async () => {
          results.push(await processValue(value));
        })());
      });

      await Promise.all(promises);
      expect(results.sort((a, b) => a - b)).assertDeepEquals([2, 4, 6]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11600
     * @tc.name SetForEachTest116
     * @tc.desc Set with elements that are WeakSet instances
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {}

      const ws1 = new WeakSet();
      const ws2 = new WeakSet();
      const obj1 = {} as BaseI;
      const obj2 = {} as BaseI;
      ws1.add(obj1);
      ws2.add(obj2);

      const set = new Set([ws1, ws2]);
      const results: boolean[] = [];

      set.forEach(ws => {
        results.push(ws.has(obj1), ws.has(obj2));
      });

      expect(results).assertDeepEquals([true, false, false, true]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11700
     * @tc.name SetForEachTest117
     * @tc.desc forEach() with callback that uses logical assignment operators
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a', 'b', 'a', 'c']);
      const result: Record<string, number> = {};

      set.forEach(key => {
        result[key] ??= 0;
        result[key]++;
      });

      expect(result).assertDeepEquals({ a: 1, b: 1, c: 1 });
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11800
     * @tc.name SetForEachTest118
     * @tc.desc Traverse Set with elements that are generator functions
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest118()).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_11900
     * @tc.name SetForEachTest119
     * @tc.desc forEach() on Set with elements that are proxies
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest119()).assertDeepEquals([20, 40]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12000
     * @tc.name SetForEachTest120
     * @tc.desc Set containing elements with custom [Symbol.iterator]
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      expect(SetForEachTest120()).assertDeepEquals([[1, 2], [3, 4]]);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12100
     * @tc.name SetForEachTest121
     * @tc.desc forEach() with callback that uses dynamic import()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async () => {
      interface BaseI {
        id: string,
        value: string
      }

      const set = new Set(['first', 'second']);
      const results: string[] = [];

      const callback = async (id: string) => {
        const mockModule = { id, value: `value-${id}` } as BaseI;
        results.push(mockModule.value);
      };

      const promises: Promise<void>[] = [];
      set.forEach(id => {
        promises.push(callback(id));
      });

      await Promise.all(promises);
      expect(results.sort()).assertDeepEquals(['value-first', 'value-second']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12400
     * @tc.name SetForEachTest124
     * @tc.desc Set containing elements with custom inspect methods
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      interface BaseI {
        name: string,
        inspect: () => string
      }

      const obj1 = {
        name: 'obj1',
        inspect: () => `CustomInspect(${obj1.name})`
      } as BaseI;
      const obj2 = {
        name: 'obj2',
        inspect: () => `CustomInspect(${obj2.name})`
      } as BaseI;

      const set = new Set([obj1, obj2]);
      const inspections: string[] = [];

      set.forEach(obj => {
        inspections.push(obj.inspect());
      });

      expect(inspections).assertDeepEquals(['CustomInspect(obj1)', 'CustomInspect(obj2)']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12700
     * @tc.name SetForEachTest127
     * @tc.desc forEach() with callback that uses String.prototype.replaceAll()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const set = new Set(['a.b.c', 'x.y.z', '1.2.3']);
      const results: string[] = [];

      set.forEach(str => {
        results.push(str.replaceAll('.', '-'));
      });

      expect(results).assertDeepEquals(['a-b-c', 'x-y-z', '1-2-3']);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_12900
     * @tc.name SetForEachTest129
     * @tc.desc forEach() on Set with elements that are Map instances with same entries
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const map1 = new Map([['key', 'value1']]);
      const map2 = new Map([['key', 'value1']]);
      const set = new Set([map1, map2]);
      const entries: [string, string][] = [];

      SetForEachTest129(set, entries);

      expect(entries).assertDeepEquals([['key', 'value1'], ['key', 'value1']]);
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_SET_FOREACH_TEST_13000
     * @tc.name SetForEachTest130
     * @tc.desc Set with elements that are different TypedArray views of same buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 4
     */
    it('SetForEachTest130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL4, async () => {
      const buffer = new ArrayBuffer(8);
      const int8View = new Int8Array(buffer);
      const uint8View = new Uint8Array(buffer);
      const int16View = new Int16Array(buffer);

      int8View.set([1, 2, 3, 4, 5, 6, 7, 8]);
      const set = new Set([int8View, uint8View, int16View]);
      const results: number[][] = [];

      set.forEach(view => {
        results.push(Array.from(view));
      });

      expect(results[0]).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(results[1]).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      expect(results[2]).assertDeepEquals([513, 1027, 1541, 2055]);
    });

  });
}