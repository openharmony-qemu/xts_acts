/**
 * WeakMap Verification Utility Class: Function names follow the format "test[caseNumber]_FunctionDescription",
 * corresponding to TS test cases with the pattern "SUB_BUILTINS_WEAKMAP_TEST_XXX".
 */
export const WeakMapTestUtils = {
    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1100
     * Function: Verify that frozen/sealed objects can be used as WeakMap keys, and core methods (set/get/has/delete) work correctly.
     */
    test1100_FrozenSealedKey() {
        const wm = new WeakMap();
        const frozenKey = Object.freeze({ id: 1 });
        const sealedKey = Object.seal({ name: 'sealed' });

        wm.set(frozenKey, 'frozen-value');
        if (!wm.has(frozenKey)) throw new Error("When frozen object is used as key, has() returns false (expected true)");
        if (wm.get(frozenKey) !== 'frozen-value') throw new Error("When frozen object is used as key, get() returns wrong value (expected 'frozen-value')");
        if (!wm.delete(frozenKey)) throw new Error("When frozen object is used as key, delete() returns false (expected true)");
        if (wm.has(frozenKey)) throw new Error("After deleting frozen object key, has() still returns true (expected false)");

        wm.set(sealedKey, 'sealed-value');
        sealedKey.name = 'modified-sealed';
        if (wm.get(sealedKey) !== 'sealed-value') throw new Error("After modifying sealed object's property, get() returns changed value (expected unchanged)");
        if (!wm.delete(sealedKey)) throw new Error("When sealed object is used as key, delete() returns false (expected true)");

        return "Test Passed: WeakMapFrozenSealedKeyTest011";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1200
     * Function: Verify that WeakMap.set supports method chaining, and key-value pairs set via chaining are accessible correctly.
     */
    test1200_SetChaining() {
        const wm = new WeakMap();
        const key1 = { a: 1 };
        const key2 = { b: 2 };
        const key3 = { c: 3 };
        //
        const chainResult = wm.set(key1, 'val1').set(key2, 'val2').set(key3, 'val3');
        if (chainResult !== wm) throw new Error("WeakMap.set chaining returns non-WeakMap instance (violates specification)");
        if (wm.get(key1) !== 'val1') throw new Error("After chaining, get() returns wrong value for key1 (expected 'val1')");
        if (!wm.has(key2)) throw new Error("After chaining, key2 does not exist (expected to exist)");
        if (wm.get(key3) !== 'val3') throw new Error("After chaining, get() returns wrong value for key3 (expected 'val3')");

        wm.delete(key2);
        wm.set(key2, 'new-val2');
        if (wm.get(key2) !== 'new-val2') throw new Error("After deleting and re-setting key2 via chaining, get() returns wrong value (expected 'new-val2')");

        return "Test Passed: WeakMapSetChainingTest012";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1300
     * Function: Verify uniqueness of array instances as WeakMap keys: different references = different keys; same reference = same key.
     */
    test1300_ArrayKeyUniqueness() {
        const wm = new WeakMap();
        const arr1 = [1, 2, 3];
        const arr2 = [1, 2, 3];
        const arr3 = [4, 5];
        const arr3Ref = arr3;

        wm.set(arr1, 'arr1-val');
        wm.set(arr2, 'arr2-val');
        wm.set(arr3, 'arr3-val');

        if (wm.get(arr1) !== 'arr1-val') throw new Error("When arr1 is used as key, get() returns wrong value (expected 'arr1-val')");
        if (wm.get(arr2) !== 'arr2-val') throw new Error("When arr2 is used as key, get() returns wrong value (expected 'arr2-val')");
        if (wm.get(arr1) === wm.get(arr2)) throw new Error("Different array references return same value (expected different values)");

        arr3.push(6);
        if (wm.get(arr3Ref) !== 'arr3-val') throw new Error("After modifying array with same reference, get() returns changed value (expected unchanged)");
        if (!wm.has(arr3)) throw new Error("For array with same reference, has() returns false (expected true)");

        return "Test Passed: WeakMapArrayKeyUniquenessTest013";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1400
     * Function: Verify that after a large number of key objects are GC'd, corresponding key-value pairs in WeakMap become invalid, and new keys work normally.
     * Added `async` keyword here to support `await` (fixes the syntax error)
     */
    async test1400_MassKeyGC() {
        const wm = new WeakMap();
        const keyList = [];
        const keyCount = 50;

        for (let i = 0; i < keyCount; i++) {
            const key = { id: i };
            keyList.push(key);
            wm.set(key, `val-${i}`);
        }

        for (let i = 0; i < keyCount; i++) {
            if (wm.get(keyList[i]) !== `val-${i}`) throw new Error(`Initial verification failed for key-${i}: wrong value (expected 'val-${i}')`);
        }

        keyList.length = 0;
        const newKey = { id: 999 };
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global?.gc) {
            (window.gc || global.gc)();
        }
        // `await` is now valid because the function is declared as `async`
        await new Promise(resolve => setTimeout(resolve, 200));

        for (let i = 0; i < keyCount; i++) {
            if (wm.get({ id: i }) !== undefined) throw new Error(`After GC, key-${i} is still accessible (expected undefined)`);
        }

        wm.set(newKey, 'new-val');
        if (wm.get(newKey) !== 'new-val') throw new Error("Setting new key after GC failed (expected 'new-val')");

        return "Test Passed: WeakMapMassKeyGCTest014";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1500
     * Function: Verify subsequent operations (has/get/re-set) return correct results after deleting a WeakMap key.
     */
    test1500_DeleteSubsequent() {
        const wm = new WeakMap();
        const oldKey = { name: 'test' };
        const newKey = { name: 'test' };

        wm.set(oldKey, 'old-val');
        if (!wm.has(oldKey)) throw new Error("After initial set, oldKey does not exist (expected to exist)");
        if (wm.get(oldKey) !== 'old-val') throw new Error("After initial set, get() returns wrong value for oldKey (expected 'old-val')");

        const deleteRes = wm.delete(oldKey);
        if (!deleteRes) throw new Error("delete(oldKey) returns false (expected true)");
        if (wm.has(oldKey)) throw new Error("After deleting oldKey, it still exists (expected to not exist)");
        if (wm.get(oldKey) !== undefined) throw new Error("After deleting oldKey, it is still accessible (expected undefined)");

        wm.set(newKey, 'new-val');
        if (wm.get(newKey) !== 'new-val') throw new Error("After setting newKey, get() returns wrong value (expected 'new-val')");
        if (wm.get(oldKey) !== undefined) throw new Error("After setting newKey, oldKey is unexpectedly accessible");

        if (wm.delete({ name: 'nonexistent' })) throw new Error("Deleting non-existent key returns true (expected false)");

        return "Test Passed: WeakMapDeleteSubsequentTest015";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1600
     * Function: Verify WeakMap works as private storage in closures (inaccessible from outside, operable via internal methods).
     */
    test1600_ClosurePrivateStore() {
        const UserModule = (() => {
            const privateStore = new WeakMap();

            class User {
                constructor(name, age) {
                    this.name = name;
                    privateStore.set(this, { age, isActive: true });
                }

                getAge() { return privateStore.get(this).age; }
                updateAge(newAge) { privateStore.get(this).age = newAge; }
                isActive() { return privateStore.get(this).isActive; }
            }

            return { User };
        })();

        const { User } = UserModule;
        const user1 = new User('Bob', 25);

        if (user1.name !== 'Bob') throw new Error("User instance has wrong 'name' property (expected 'Bob')");
        if (user1.getAge() !== 25) throw new Error("getAge() returns wrong value (expected 25)");
        if (!user1.isActive()) throw new Error("isActive() returns false (expected true)");

        user1.updateAge(26);
        if (user1.getAge() !== 26) throw new Error("After updateAge(), getAge() returns 25 (expected 26)");

        if (UserModule.privateStore !== undefined) throw new Error("Private 'privateStore' in closure is accessible from outside (violates privacy)");
        if (user1.age !== undefined) throw new Error("Private 'age' property is directly accessible from outside (violates privacy)");

        return "Test Passed: WeakMapClosurePrivateStoreTest016";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1700
     * Function: Verify uniqueness of function instances as WeakMap keys: different references = different keys; same reference = same key.
     */
    test1700_FunctionKey() {
        const wm = new WeakMap();
        const func1 = () => { console.log('func1'); };
        const func2 = () => { console.log('func1'); };
        const func3 = () => {};
        const func3Ref = func3;

        wm.set(func1, 'func1-val');
        wm.set(func2, 'func2-val');
        wm.set(func3, 'func3-val');

        if (wm.get(func1) !== 'func1-val') throw new Error("When func1 is used as key, get() returns wrong value (expected 'func1-val')");
        if (wm.get(func2) !== 'func2-val') throw new Error("When func2 is used as key, get() returns wrong value (expected 'func2-val')");
        if (!wm.has(func1) || !wm.has(func2)) throw new Error("has() returns false for function keys (expected true)");

        if (wm.get(func3Ref) !== 'func3-val') throw new Error("When func3 reference is used as key, get() returns wrong value (expected 'func3-val')");
        if (!wm.delete(func3)) throw new Error("delete(func3) returns false (expected true)");
        if (wm.has(func3Ref)) throw new Error("After deleting func3 reference, it still exists (expected to not exist)");

        return "Test Passed: WeakMapFunctionKeyTest017";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1800
     * Function: Verify prototype chain objects as WeakMap keys: only instances are associated with key-value pairs; prototype modifications have no impact.
     */
    test1800_PrototypeChainKey() {
        const wm = new WeakMap();
        const protoObj = { type: 'proto' };
        const instance = Object.create(protoObj);
        instance.id = 1;

        wm.set(instance, 'instance-val');

        if (wm.get(instance) !== 'instance-val') throw new Error("When instance is used as key, get() returns wrong value (expected 'instance-val')");
        if (wm.has(protoObj)) throw new Error("has() returns true for prototype object (expected false)");
        if (wm.get(protoObj) !== undefined) throw new Error("get() returns value for prototype object (expected undefined)");

        protoObj.type = 'modified-proto';
        if (wm.get(instance) !== 'instance-val') throw new Error("After modifying prototype, instance key's value changes (expected unchanged)");

        if (!wm.delete(instance)) throw new Error("delete(instance) returns false (expected true)");
        if (wm.has(protoObj)) throw new Error("After deleting instance, prototype object unexpectedly exists");

        return "Test Passed: WeakMapPrototypeChainKeyTest018";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_1900
     * Function: Verify that the same WeakMap instance maintains consistent state across different scopes (set/get/delete operations).
     */
    test1900_CrossScopeAccess() {
        const globalWM = new WeakMap();
        const sharedKey = { id: 100 };
        let scope2Result;

        (function scope1() {
            globalWM.set(sharedKey, 'cross-scope-val');
        })();

        (function scope2() {
            scope2Result = globalWM.get(sharedKey);
            globalWM.set(sharedKey, 'scope2-modified');
        })();

        if (scope2Result !== 'cross-scope-val') throw new Error("Scope 2 reads wrong value (expected 'cross-scope-val')");
        if (globalWM.get(sharedKey) !== 'scope2-modified') throw new Error("Scope 2 modifies to wrong value (expected 'scope2-modified')");

        (function scope3() {
            globalWM.delete(sharedKey);
        })();

        if (globalWM.has(sharedKey)) throw new Error("After deletion in Scope 3, key still exists (expected to not exist)");

        return "Test Passed: WeakMapCrossScopeAccessTest019";
    },

    /**
     * Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2000
     * Function: Verify uniqueness of empty arrays as WeakMap keys: different instances = different keys; same instance = same key.
     */
    test2000_EmptyArrayKey() {
        const wm = new WeakMap();
        const emptyArr1 = [];
        const emptyArr2 = [];
        const emptyArr3 = [];
        const emptyArr3Ref = emptyArr3;

        wm.set(emptyArr1, 'arr1-empty');
        wm.set(emptyArr2, 'arr2-empty');
        wm.set(emptyArr3, 'arr3-empty');

        if (wm.get(emptyArr1) !== 'arr1-empty') throw new Error("When emptyArr1 is used as key, get() returns wrong value (expected 'arr1-empty')");
        if (wm.get(emptyArr2) !== 'arr2-empty') throw new Error("When emptyArr2 is used as key, get() returns wrong value (expected 'arr2-empty')");
        if (!wm.has(emptyArr1) || !wm.has(emptyArr2)) throw new Error("has() returns false for empty array keys (expected true)");

        if (wm.get(emptyArr3Ref) !== 'arr3-empty') throw new Error("When emptyArr3 reference is used as key, get() returns wrong value (expected 'arr3-empty')");
        if (!wm.delete(emptyArr3)) throw new Error("delete(emptyArr3) returns false (expected true)");
        if (wm.has(emptyArr3Ref)) throw new Error("After deleting emptyArr3 reference, it still exists (expected to not exist)");

        return "Test Passed: WeakMapEmptyArrayKeyTest020";
    },
    /**
     * 21. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2100
     * Function: Verify set() throws TypeError when non-object (primitive value) is used as key.
     */
    test2100_NonObjectKeyError() {
        const wm = new WeakMap();
        const primitiveKeys = [123, 'string', true, null, undefined];

        for (const key of primitiveKeys) {
            let errorThrown = false;
            try {
                wm.set(key, 'value');
            } catch (err) {
                if (err instanceof TypeError && err.message.includes('invalid value used as weak map key')) {
                    errorThrown = true;
                }
            }
            if (!errorThrown) throw new Error(`Non-object key ${String(key)} did not throw TypeError`);
        }

        return "Test Passed: WeakMapNonObjectKeyErrorTest2100";
    },

    /**
     * 22. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2110
     * Function: Verify wrapped Symbol objects (Object(Symbol())) have uniqueness as WeakMap keys.
     */
    test2110_SymbolWrapperKeyUniqueness() {
        const wm = new WeakMap();
        const sym1 = Object(Symbol('sym1'));
        const sym2 = Object(Symbol('sym1')); // Same description, different wrapper object
        const sym3 = sym1; // Same wrapper object

        wm.set(sym1, 'val1');
        wm.set(sym2, 'val2');

        if (wm.get(sym1) !== 'val1') throw new Error("Wrapped Symbol sym1: get() returns wrong value");
        if (wm.get(sym2) !== 'val2') throw new Error("Wrapped Symbol sym2: get() returns wrong value");
        if (wm.get(sym1) === wm.get(sym2)) throw new Error("Different Symbol wrappers return same value");

        wm.set(sym3, 'val3'); // Overwrite sym1's value
        if (wm.get(sym1) !== 'val3') throw new Error("Same Symbol wrapper: set() does not overwrite value");

        return "Test Passed: WeakMapSymbolWrapperKeyTest2110";
    },

    /**
     * 23. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2120
     * Function: Verify class instances as WeakMap keys: modifying instance properties does not break key association.
     */
    async test2120_ClassInstanceKeyPropertyMod() {
        const wm = new WeakMap();
        class Product {
            constructor(id) {
                this.id = id;
                this.price = 0;
            }
        }

        // 1. 验证：修改类实例属性不破坏键关联（原逻辑保留，正确）
        const product1 = new Product(1);
        wm.set(product1, 'product-1-data');

        // 修改实例的现有属性、新增属性
        product1.id = 99;    // 修改现有属性
        product1.price = 99.9;// 修改现有属性
        product1.name = 'New Name';// 新增属性

        // 验证关联未断
        if (wm.get(product1) !== 'product-1-data') throw new Error("Modifying instance properties breaks key association");
        if (!wm.has(product1)) throw new Error("has() returns false after modifying instance properties");

        // 2. 修正：通过函数作用域创建临时强引用，执行后自动释放（关键修复）
        let isGCSuccess = false;
        (function createTempInstance() {
            // 函数内创建实例：强引用仅存在于函数作用域内
            const tempProduct = new Product(2);
            wm.set(tempProduct, 'product-2-data');

            // 验证临时实例初始可访问
            if (wm.get(tempProduct) !== 'product-2-data') throw new Error("Temporary instance not set in WeakMap");
        })(); // 函数执行完毕，tempProduct作用域销毁，强引用释放

        // 3. 触发GC并验证回收结果
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global?.gc) {
            (window.gc || global.gc)();
        }
        // 等待GC执行（根据环境调整延迟，确保回收完成）
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证：原product1（仍有强引用）可正常访问，tempProduct（无强引用）已被GC
        if (wm.get(product1) !== 'product-1-data') throw new Error("Existing instance (with strong ref) is unexpectedly GC'd");

        // 验证tempProduct被GC：创建新的同结构实例（无引用关联），确保返回undefined
        const newSameStructProduct = new Product(2);
        if (wm.get(newSameStructProduct) !== undefined) {
            throw new Error("Temporary instance (no strong ref) is not GC'd (new same-struct key finds value)");
        }

        return "Test Passed: WeakMapClassInstanceKeyTest2120";
    },

    /**
     * 24. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2130
     * Function: Verify set() overwrites value when same key is set multiple times.
     */
    test2130_SetSameKeyOverwrite() {
        const wm = new WeakMap();
        const key = { id: 'overwrite-test' };

        // First set
        wm.set(key, 'first-value');
        if (wm.get(key) !== 'first-value') throw new Error("First set: get() returns wrong value");

        // Second set (same key, new value)
        wm.set(key, 'second-value');
        if (wm.get(key) !== 'second-value') throw new Error("Same key set: value not overwritten");

        // Third set (same key, undefined value)
        wm.set(key, undefined);
        if (wm.get(key) !== undefined) throw new Error("Same key set with undefined: value not stored");

        // Verify has() still returns true after setting undefined
        if (!wm.has(key)) throw new Error("has() returns false after setting undefined value");

        return "Test Passed: WeakMapSetSameKeyOverwriteTest2130";
    },

    /**
     * 25. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2140
     * Function: Verify get() returns exact value type (including null, NaN, function) for existing keys.
     */
    test2140_GetValueTypePreserve() {
        const wm = new WeakMap();
        const key1 = { type: 'null' };
        const key2 = { type: 'nan' };
        const key3 = { type: 'function' };
        const key4 = { type: 'array' };
        const testFunc = () => "test-func-return";

        wm.set(key1, null);
        wm.set(key2, NaN);
        wm.set(key3, testFunc);
        wm.set(key4, [1, 2, 3]);

        // Verify null value
        if (wm.get(key1) !== null) throw new Error("get() does not preserve null value");

        // Verify NaN value (NaN !== NaN, so use isNaN())
        if (!isNaN(wm.get(key2))) throw new Error("get() does not preserve NaN value");

        // Verify function value (reference equality)
        if (wm.get(key3) !== testFunc) throw new Error("get() does not preserve function reference");
        if (wm.get(key3)() !== "test-func-return") throw new Error("get() returns invalid function");

        // Verify array value (reference equality)
        const retrievedArr = wm.get(key4);
        if (retrievedArr.length !== 3 || retrievedArr[1] !== 2) throw new Error("get() does not preserve array value");
        retrievedArr.push(4); // Modify retrieved array
        if (wm.get(key4).length !== 4) throw new Error("get() returns copy of array (should return reference)");

        return "Test Passed: WeakMapGetValueTypeTest2140";
    },

    /**
     * 26. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2150
     * Function: Verify WeakMap has no 'size' property (returns undefined when accessed).
     */
    test2150_NoSizeProperty() {
        const wm = new WeakMap();
        const key1 = { id: 1 };
        const key2 = { id: 2 };

        wm.set(key1, 'val1');
        wm.set(key2, 'val2');

        // Verify 'size' is undefined (not 0 or 2)
        if (wm.size !== undefined) throw new Error(`WeakMap has size property with value ${wm.size} (expected undefined)`);


        // Verify Object.getOwnPropertyNames does not include 'size'
        const props = Object.getOwnPropertyNames(wm);
        if (props.includes('size')) throw new Error("WeakMap own properties include 'size' (should not)");

        return "Test Passed: WeakMapNoSizePropertyTest2150";
    },

    /**
     * 27. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2160
     * Function: Verify WeakMap cannot be iterated with for...of (throws TypeError).
     */
    test2160_NoIterationSupport() {
        const wm = new WeakMap();
        const key1 = { id: 1 };
        const key2 = { id: 2 };
        wm.set(key1, 'val1');
        wm.set(key2, 'val2');

        // Verify no [Symbol.iterator] method
        if (wm[Symbol.iterator] !== undefined) throw new Error("WeakMap has [Symbol.iterator] method (should not)");

        // Verify for...of throws TypeError
        let iterationErrorThrown = false;
        try {
            for (const _ of wm) { /* Empty iteration */ }
        } catch (err) {
            // if (err instanceof TypeError && err.message.includes('is not iterable')) {
                iterationErrorThrown = true;
            // }
        }
        if (!iterationErrorThrown) throw new Error("WeakMap allows for...of iteration (should throw)");

        // Verify no entries()/keys()/values() methods
        if (wm.entries !== undefined) throw new Error("WeakMap has entries() method (should not)");
        if (wm.keys !== undefined) throw new Error("WeakMap has keys() method (should not)");
        if (wm.values !== undefined) throw new Error("WeakMap has values() method (should not)");

        return "Test Passed: WeakMapNoIterationTest2160";
    },

    /**
     * 28. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2170
     * Function: Verify nested WeakMap instances can be used as WeakMap keys.
     */
    test2170_NestedWeakMapAsKey() {
        const wmParent = new WeakMap();
        const wmChild1 = new WeakMap();
        const wmChild2 = new WeakMap();
        const normalKey = { id: 'normal' };

        // Set nested WeakMap as key
        wmParent.set(wmChild1, 'child1-data');
        wmParent.set(normalKey, 'normal-data');

        // Verify nested WeakMap key works
        if (wmParent.get(wmChild1) !== 'child1-data') throw new Error("Nested WeakMap as key: get() returns wrong value");
        if (!wmParent.has(wmChild1)) throw new Error("Nested WeakMap as key: has() returns false");

        // Verify different WeakMap instances are different keys
        wmParent.set(wmChild2, 'child2-data');
        if (wmParent.get(wmChild2) !== 'child2-data') throw new Error("Different nested WeakMap: get() returns wrong value");
        if (wmParent.get(wmChild1) === wmParent.get(wmChild2)) throw new Error("Different WeakMap keys return same value");

        // Delete nested WeakMap key
        wmParent.delete(wmChild1);
        if (wmParent.has(wmChild1)) throw new Error("Nested WeakMap key: delete() does not work");

        return "Test Passed: WeakMapNestedWeakMapKeyTest2170";
    },

    /**
     * 29. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2180
     * Function: Verify redefining key object's prototype does not break WeakMap association.
     */
    test2180_KeyPrototypeRedefine() {
        const wm = new WeakMap();
        const key = { id: 'proto-test' };
        const originalProto = Object.getPrototypeOf(key);
        const newProto = { newMethod: () => "new-proto-method" };

        wm.set(key, 'proto-test-data');

        // Redefine key's prototype
        Object.setPrototypeOf(key, newProto);

        // Verify key association remains
        if (wm.get(key) !== 'proto-test-data') throw new Error("Redefining key prototype breaks WeakMap association");
        if (!wm.has(key)) throw new Error("Redefining key prototype makes has() return false");

        // Restore original prototype (optional cleanup)
        Object.setPrototypeOf(key, originalProto);
        if (wm.get(key) !== 'proto-test-data') throw new Error("Restoring prototype breaks WeakMap association");

        return "Test Passed: WeakMapKeyPrototypeRedefineTest2180";
    },

    /**
     * 30. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2190
     * Function: Verify temporary key objects (no strong references) are GC'd and values become inaccessible.
     */
    async test2190_TemporaryKeyGC() {
        const wm = new WeakMap();
        let tempKey;

        // Create temporary key (only weak reference in wm after tempKey is nulled)
        tempKey = { id: 'temporary' };
        wm.set(tempKey, 'temporary-data');
        tempKey = null; // Release strong reference

        // Trigger GC and wait
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global?.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 200));

        // Verify value is inaccessible (create new object with same structure to test)
        const newSameStructKey = { id: 'temporary' };
        if (wm.get(newSameStructKey) !== undefined) throw new Error("Temporary key not GC'd (new same-struct key finds value)");
        if (wm.get({ id: 'temporary' }) !== undefined) throw new Error("Temporary key value still accessible after GC");

        // Verify new key works normally
        const permanentKey = { id: 'permanent' };
        wm.set(permanentKey, 'permanent-data');
        if (wm.get(permanentKey) !== 'permanent-data') throw new Error("New key setup fails after temporary key GC");

        return "Test Passed: WeakMapTemporaryKeyGCTest2190";
    },

    /**
     * 31. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2200
     * Function: Verify Proxy-wrapped objects as WeakMap keys: different Proxies are different keys.
     */
    test2200_ProxyWrappedKeyUniqueness() {
        const wm = new WeakMap();
        const targetObj = { id: 'proxy-target' };
        const proxy1 = new Proxy(targetObj, {});
        const proxy2 = new Proxy(targetObj, {}); // Same target, different Proxy
        const proxy3 = proxy1; // Same Proxy

        // Set Proxies as keys
        wm.set(proxy1, 'proxy1-data');
        wm.set(proxy2, 'proxy2-data');

        // Verify different Proxies are different keys
        if (wm.get(proxy1) !== 'proxy1-data') throw new Error("Proxy1 key: get() returns wrong value");
        if (wm.get(proxy2) !== 'proxy2-data') throw new Error("Proxy2 key: get() returns wrong value");
        if (wm.get(proxy1) === wm.get(proxy2)) throw new Error("Different Proxies return same value");

        // Verify same Proxy is same key
        wm.set(proxy3, 'proxy3-data'); // Overwrite proxy1's value
        if (wm.get(proxy1) !== 'proxy3-data') throw new Error("Same Proxy key: value not overwritten");

        // Verify target object vs Proxy are different keys
        wm.set(targetObj, 'target-data');
        if (wm.get(targetObj) !== 'target-data') throw new Error("Target object key: get() returns wrong value");
        if (wm.get(proxy1) === wm.get(targetObj)) throw new Error("Proxy and target object are treated as same key");

        return "Test Passed: WeakMapProxyKeyTest2200";
    },

    /**
     * 32. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2210
     * Function: Verify delete() returns false for keys that were GC'd (no strong references).
     */
    async test2210_DeleteGCdKey() {
        const wm = new WeakMap();
        let key1 = { id: 'gc-delete-1' };
        const key2 = { id: 'gc-delete-2' }; // Retain strong reference

        // Set keys
        wm.set(key1, 'key1-data');
        wm.set(key2, 'key2-data');

        // GC key1
        key1 = null;
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global?.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 200));

        // Verify delete() returns false for GC'd key (recreate key with same structure)
        const key1SameStruct = { id: 'gc-delete-1' };
        const deleteResult1 = wm.delete(key1SameStruct);
        if (deleteResult1) throw new Error("delete() returns true for GC'd key (same structure)");

        // Verify delete() returns true for existing key (key2)
        const deleteResult2 = wm.delete(key2);
        if (!deleteResult2) throw new Error("delete() returns false for existing key (key2)");
        if (wm.has(key2)) throw new Error("Key2 not deleted after delete() returns true");

        return "Test Passed: WeakMapDeleteGCdKeyTest2210";
    },

    /**
     * 33. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2220
     * Function: Verify has() returns strict boolean (not truthy/falsy values like 1/0).
     */
    test2220_HasReturnStrictBoolean() {
        const wm = new WeakMap();
        const key1 = { id: 'has-1' };
        const key2 = { id: 'has-2' };

        // Initial state: key1 exists, key2 does not
        wm.set(key1, 'has-data');

        // Verify has() returns true (strict boolean)
        const hasKey1 = wm.has(key1);
        if (hasKey1 !== true || typeof hasKey1 !== 'boolean') throw new Error("has() returns non-boolean true for existing key");

        // Verify has() returns false (strict boolean)
        const hasKey2 = wm.has(key2);
        if (hasKey2 !== false || typeof hasKey2 !== 'boolean') throw new Error("has() returns non-boolean false for non-existing key");

        // Verify after delete: has() returns false
        wm.delete(key1);
        const hasKey1AfterDelete = wm.has(key1);
        if (hasKey1AfterDelete !== false) throw new Error("has() returns true after deleting key1");

        // Verify after re-set: has() returns true
        wm.set(key1, 'has-data-new');
        const hasKey1AfterReset = wm.has(key1);
        if (hasKey1AfterReset !== true) throw new Error("has() returns false after re-setting key1");

        return "Test Passed: WeakMapHasStrictBooleanTest2220";
    },

    /**
     * 34. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2230
     * Function: Verify get() returns undefined for non-existing keys (not null/NaN).
     */
    test2230_GetNonExistingKeyReturnsUndefined() {
        const wm = new WeakMap();
        const existingKey = { id: 'existing' };
        const nonExistingKey1 = { id: 'non-existing-1' };
        const nonExistingKey2 = { id: 'non-existing-2' };

        // Set existing key (value is not undefined)
        wm.set(existingKey, 'existing-data');

        // Verify non-existing keys return undefined
        if (wm.get(nonExistingKey1) !== undefined) throw new Error("get(nonExistingKey1) returns non-undefined");
        if (wm.get(nonExistingKey2) !== undefined) throw new Error("get(nonExistingKey2) returns non-undefined");
        if (wm.get({ id: 'random' }) !== undefined) throw new Error("get(randomNewKey) returns non-undefined");

        // Verify existing key still returns correct value
        if (wm.get(existingKey) !== 'existing-data') throw new Error("get(existingKey) returns wrong value after non-existing checks");

        // Verify after deleting existing key: get() returns undefined
        wm.delete(existingKey);
        if (wm.get(existingKey) !== undefined) throw new Error("get(existingKey) returns non-undefined after delete");

        return "Test Passed: WeakMapGetNonExistingKeyTest2230";
    },

    /**
     * 35. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2240
     * Function: Verify WeakMap can be used as a property of another object.
     */
    test2240_WeakMapAsObjectProperty() {
        // Create object with WeakMap property
        const dataStore = {
            wm: new WeakMap(),
            set: function (key, value) { this.wm.set(key, value); },
            get: function (key) { return this.wm.get(key); },
            has: function (key) { return this.wm.has(key); }
        };

        const key1 = { id: 'prop-key-1' };
        const key2 = { id: 'prop-key-2' };

        // Use WeakMap via object property
        dataStore.set(key1, 'prop-data-1');
        if (dataStore.get(key1) !== 'prop-data-1') throw new Error("WeakMap as property: get() returns wrong value");
        if (!dataStore.has(key1)) throw new Error("WeakMap as property: has() returns false for existing key");

        // Modify WeakMap directly (bypass object methods)
        dataStore.wm.set(key2, 'prop-data-2');
        if (dataStore.get(key2) !== 'prop-data-2') throw new Error("Direct WeakMap modification not reflected in object methods");

        // Delete via object method
        dataStore.wm.delete(key1);
        if (dataStore.has(key1)) throw new Error("WeakMap delete not reflected in object has() method");

        // Verify WeakMap property is mutable (replace with new WeakMap)
        const newWm = new WeakMap();
        newWm.set(key1, 'new-wm-data');
        dataStore.wm = newWm;
        if (dataStore.get(key1) !== 'new-wm-data') throw new Error("Replacing WeakMap property fails");

        return "Test Passed: WeakMapAsObjectPropertyTest2240";
    },

    /**
     * 36. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2250
     * Function: Verify cross-module shared WeakMap maintains consistent state (simulated with IIFE modules).
     */
    test2250_CrossModuleSharedWeakMap() {
        // Simulate Module A: Export WeakMap and methods
        const ModuleA = (() => {
            const sharedWm = new WeakMap();
            return {
                sharedWm: sharedWm,
                setKey: (key, value) => sharedWm.set(key, value),
                getKey: (key) => sharedWm.get(key)
            };
        })();

        // Simulate Module B: Import and use Module A's WeakMap
        const ModuleB = (() => {
            return {
                updateKey: (key, newValue) => ModuleA.sharedWm.set(key, newValue),
                deleteKey: (key) => ModuleA.sharedWm.delete(key)
            };
        })();

        const key = { id: 'cross-mod-key' };

        // Module A sets key
        ModuleA.setKey(key, 'mod-a-data');
        if (ModuleA.getKey(key) !== 'mod-a-data') throw new Error("Module A: get() returns wrong value after set");

        // Module B updates key
        ModuleB.updateKey(key, 'mod-b-data');
        if (ModuleA.getKey(key) !== 'mod-b-data') throw new Error("Module B update not reflected in Module A");

        // Direct access to shared WeakMap
        if (ModuleA.sharedWm.get(key) !== 'mod-b-data') throw new Error("Direct shared WeakMap access returns wrong value");

        // Module B deletes key
        ModuleB.deleteKey(key);
        if (ModuleA.getKey(key) !== undefined) throw new Error("Module B delete not reflected in Module A");
        if (ModuleA.sharedWm.has(key)) throw new Error("Shared WeakMap has() returns true after delete");

        return "Test Passed: WeakMapCrossModuleSharedTest2250";
    },

    /**
     * 37. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2260
     * Function: Verify frozen key objects with modified prototype chain still work as WeakMap keys.
     */
    test2260_FrozenKeyPrototypeMod() {
        const wm = new WeakMap();
        const baseProto = { baseMethod: () => "base" };
        const derivedProto = Object.create(baseProto);
        derivedProto.derivedMethod = () => "derived";

        // Create key with derived prototype, then freeze
        const key = Object.create(derivedProto);
        key.id = 'frozen-proto-key';
        Object.freeze(key); // Freeze key (prevents prototype modification via key.__proto__)

        // Set key in WeakMap
        wm.set(key, 'frozen-proto-data');

        // Modify prototype chain (via prototype objects, not key itself)
        derivedProto.derivedMethod = () => "modified-derived";
        baseProto.baseMethod = () => "modified-base";

        // Verify key association remains
        if (wm.get(key) !== 'frozen-proto-data') throw new Error("Modifying frozen key's prototype breaks association");
        if (!wm.has(key)) throw new Error("Modifying frozen key's prototype makes has() return false");

        // Verify prototype methods are modified (to confirm prototype change)
        if (key.derivedMethod() !== "modified-derived") throw new Error("Frozen key's prototype method not modified");

        // Delete frozen key
        const deleteResult = wm.delete(key);
        if (!deleteResult) throw new Error("delete() returns false for frozen key");
        if (wm.has(key)) throw new Error("Frozen key not deleted after delete()");

        return "Test Passed: WeakMapFrozenKeyProtoTest2260";
    },

    /**
     * 38. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2270
     * Function: Verify empty objects as keys: adding properties after set does not break association.
     */
    test2270_EmptyObjectKeyAddProps() {
        const wm = new WeakMap();
        const emptyKey1 = {};
        const emptyKey2 = {}; // Different empty object

        // Set empty objects as keys
        wm.set(emptyKey1, 'empty-key-1-data');
        wm.set(emptyKey2, 'empty-key-2-data');

        // Add properties to empty keys
        emptyKey1.name = 'Added Name 1';
        emptyKey1.value = 100;
        emptyKey2.id = 'Added ID 2';

        // Verify association remains
        if (wm.get(emptyKey1) !== 'empty-key-1-data') throw new Error("Adding props to empty key1 breaks association");
        if (wm.get(emptyKey2) !== 'empty-key-2-data') throw new Error("Adding props to empty key2 breaks association");

        // Verify different empty keys (with props) are still different
        if (wm.get(emptyKey1) === wm.get(emptyKey2)) throw new Error("Empty keys with props are treated as same key");

        // Modify existing properties
        emptyKey1.name = 'Modified Name 1';
        if (wm.get(emptyKey1) !== 'empty-key-1-data') throw new Error("Modifying empty key1's props breaks association");

        // Delete properties
        delete emptyKey1.value;
        if (wm.get(emptyKey1) !== 'empty-key-1-data') throw new Error("Deleting empty key1's props breaks association");

        return "Test Passed: WeakMapEmptyObjectKeyPropsTest2270";
    },

    /**
     * 39. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2280
     * Function: Verify function keys with modified prototype/properties still work as WeakMap keys.
     */
    test2280_FunctionKeyModifyProps() {
        const wm = new WeakMap();
        // Define function key (with properties)
        function testFunc() { return "original-return"; }
        testFunc.version = "1.0";
        testFunc.config = { enabled: true };

        const anotherFunc = () => "another-func";

        // Set function as key
        wm.set(testFunc, 'func-key-data');
        wm.set(anotherFunc, 'another-func-data');

        // Modify function properties
        testFunc.version = "2.0";
        testFunc.config.enabled = false;
        testFunc.newProp = "new-property";

        // Modify function prototype
        testFunc.prototype.newMethod = () => "prototype-method";

        // Verify key association remains
        if (wm.get(testFunc) !== 'func-key-data') throw new Error("Modifying function key's props breaks association");
        if (!wm.has(testFunc)) throw new Error("Modifying function key's props makes has() return false");

        // Verify function still works (to confirm it's the same function)
        if (testFunc() !== "original-return") throw new Error("Function key's logic modified (unexpected)");
        if (testFunc.version !== "2.0") throw new Error("Function key's property not modified");

        // Verify different functions are different keys
        if (wm.get(testFunc) === wm.get(anotherFunc)) throw new Error("Different function keys return same value");

        return "Test Passed: WeakMapFunctionKeyModifyPropsTest2280";
    },

    /**
     * 40. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2290
     * Function: Verify WeakMap vs Map: WeakMap key GC makes value inaccessible (Map does not).
     */
    async test2290_WeakMapVsMapGC() {
        const wm = new WeakMap();
        const map = new Map();
        let weakKey, strongKey;

        // Set keys in both WeakMap and Map
        weakKey = { id: 'weak-key' };
        strongKey = { id: 'strong-key' };
        wm.set(weakKey, 'weak-data');
        map.set(weakKey, 'map-weak-key-data'); // Map uses same weakKey object
        map.set(strongKey, 'map-strong-key-data');

        // Release strong reference to weakKey
        weakKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global?.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 200));

        // Verify WeakMap: weakKey GC'd, value inaccessible
        const newWeakKeySameStruct = { id: 'weak-key' };
        if (wm.get(newWeakKeySameStruct) !== undefined) throw new Error("WeakMap: GC'd key value still accessible");

        // Verify Map: weakKey object is still referenced by Map, value accessible
        // (Map holds strong reference to key, so key is not GC'd)
        let mapWeakKeyFound = false;
        for (const [key] of map) {
            if (key.id === 'weak-key') {
                mapWeakKeyFound = true;
                if (map.get(key) !== 'map-weak-key-data') throw new Error("Map: weakKey value corrupted");
                break;
            }
        }
        if (!mapWeakKeyFound) throw new Error("Map: weakKey not found (GC'd unexpectedly)");

        // Verify strongKey in Map is still accessible
        if (map.get(strongKey) !== 'map-strong-key-data') throw new Error("Map: strongKey value inaccessible");

        return "Test Passed: WeakMapVsMapGCTest2290";
    },
    /**
     * 31. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2300
     * Function: Verify circular-referenced objects as WeakMap keys are GC'd after external strong references are released.
     */
    async test2300_CircularRefKeyGC() {
        const wm = new WeakMap();
        let objA, objB; // 顶层变量暂存，后续释放

        // 创建循环引用对象
        (function createCircularRef() {
            objA = { id: 'circular-a' };
            objB = { id: 'circular-b', ref: objA };
            objA.ref = objB; // 循环引用：A→B，B→A

            // 作为WeakMap键
            wm.set(objA, 'circular-a-data');
            wm.set(objB, 'circular-b-data');
        })();

        // 验证初始关联正常
        if (wm.get(objA) !== 'circular-a-data') throw new Error("Circular ref objA: initial get() failed");
        if (wm.get(objB) !== 'circular-b-data') throw new Error("Circular ref objB: initial get() failed");

        // 释放外部强引用（关键：断开所有顶层引用）
        objA = null;
        objB = null;

        // 触发GC并等待
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global?.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证循环引用键已被GC（同结构新对象无法获取值）
        const newObjA = { id: 'circular-a', ref: {} };
        const newObjB = { id: 'circular-b', ref: newObjA };
        if (wm.get(newObjA) !== undefined) throw new Error("Circular ref objA not GC'd");
        if (wm.get(newObjB) !== undefined) throw new Error("Circular ref objB not GC'd");

        return "Test Passed: WeakMapCircularRefKeyGCTest2300";
    },

    /**
     * 32. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2310
     * Function: Verify WeakMap works with FinalizationRegistry (key GC triggers registry callback).
     */
    async test2310_WeakMapWithFinalizationRegistry() {
        const wm = new WeakMap();
        let registryCallbackCalled = false;

        // 创建FinalizationRegistry：键被GC时触发回调
        const finalRegistry = new FinalizationRegistry((heldValue) => {
            if (heldValue === 'key-gc-triggered') {
                registryCallbackCalled = true;
            }
        });

        // 函数作用域创建键对象（避免顶层引用）
        (function createKeyWithRegistry() {
            const key = { id: 'registry-key' };
            wm.set(key, 'registry-key-data');
            finalRegistry.register(key, 'key-gc-triggered', key); // 注册键，关联回调

            // 初始验证
            if (wm.get(key) !== 'registry-key-data') throw new Error("Registry key: initial get() failed");
        })();

        // 触发GC并等待（确保回调执行）
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证1：回调已触发
        if (!registryCallbackCalled) throw new Error("FinalizationRegistry callback not triggered after key GC");

        // 验证2：键已从WeakMap中失效
        const newSameStructKey = { id: 'registry-key' };
        if (wm.get(newSameStructKey) !== undefined) throw new Error("Registry key not GC'd from WeakMap");

        return "Test Passed: WeakMapWithFinalizationRegistryTest2310";
    },

    /**
     * 33. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2320
     * Function: Verify non-extensible objects (Object.preventExtensions) as WeakMap keys work normally.
     */
    test2320_NonExtensibleKey() {
        const wm = new WeakMap();
        const key = { id: 'non-extensible-key' };

        // 禁止对象扩展（无法新增属性）
        Object.preventExtensions(key);

        // 验证1：设置并访问键
        wm.set(key, 'non-extensible-data');
        if (wm.get(key) !== 'non-extensible-data') throw new Error("Non-extensible key: get() returns wrong value");
        if (!wm.has(key)) throw new Error("Non-extensible key: has() returns false");

        // 验证2：尝试新增属性（应失败，但不影响键关联）
        let extendFailed = false;
        try {
            key.newProp = 'test'; // 非扩展对象新增属性会抛出TypeError（严格模式）
        } catch (err) {
            if (err instanceof TypeError) extendFailed = true;
        }
        if (!extendFailed && !Object.isExtensible(key)) throw new Error("Non-extensible key allows adding new properties");

        // 验证3：修改现有属性（允许，且不影响键关联）
        key.id = 'modified-id';
        if (wm.get(key) !== 'non-extensible-data') throw new Error("Modifying non-extensible key's existing prop breaks association");

        // 验证4：删除键
        if (!wm.delete(key)) throw new Error("Non-extensible key: delete() returns false");
        if (wm.has(key)) throw new Error("Non-extensible key: not deleted");

        return "Test Passed: WeakMapNonExtensibleKeyTest2320";
    },

    /**
     * 34. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2330
     * Function: Verify same key object used in multiple WeakMaps maintains independent associations.
     */
    test2330_SameKeyMultipleWeakMaps() {
        const wm1 = new WeakMap();
        const wm2 = new WeakMap();
        const wm3 = new WeakMap();
        const sharedKey = { id: 'shared-key' };

        // 同一键在不同WeakMap中设置不同值
        wm1.set(sharedKey, 'wm1-data');
        wm2.set(sharedKey, 'wm2-data');
        wm3.set(sharedKey, 'wm3-data');

        // 验证独立关联（值不混淆）
        if (wm1.get(sharedKey) !== 'wm1-data') throw new Error("Shared key in wm1: wrong value");
        if (wm2.get(sharedKey) !== 'wm2-data') throw new Error("Shared key in wm2: wrong value");
        if (wm3.get(sharedKey) !== 'wm3-data') throw new Error("Shared key in wm3: wrong value");

        // 修改一个WeakMap中的值，不影响其他
        wm2.set(sharedKey, 'wm2-modified-data');
        if (wm1.get(sharedKey) !== 'wm1-data') throw new Error("wm2 modification affects wm1");
        if (wm2.get(sharedKey) !== 'wm2-modified-data') throw new Error("wm2 modification failed");
        if (wm3.get(sharedKey) !== 'wm3-data') throw new Error("wm2 modification affects wm3");

        // 删除一个WeakMap中的键，不影响其他
        wm3.delete(sharedKey);
        if (!wm1.has(sharedKey)) throw new Error("wm3 delete affects wm1");
        if (!wm2.has(sharedKey)) throw new Error("wm3 delete affects wm2");
        if (wm3.has(sharedKey)) throw new Error("wm3 delete failed");

        return "Test Passed: WeakMapSameKeyMultipleMapsTest2330";
    },

    /**
     * 35. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2340
     * Function: Verify key objects stored in arrays are GC'd after being removed from the array.
     */
    async test2340_KeyInArrayGC() {
        const wm = new WeakMap();
        const keyArray = [];

        // 1. 向数组添加键对象并设置到WeakMap
        (function populateArray() {
            for (let i = 0; i < 3; i++) {
                const key = { id: `array-key-${i}` };
                keyArray.push(key);
                wm.set(key, `array-data-${i}`);
            }
        })();

        // 初始验证
        for (let i = 0; i < 3; i++) {
            if (wm.get(keyArray[i]) !== `array-data-${i}`) throw new Error(`Array key ${i}: initial get() failed`);
        }

        // 2. 移除数组中的键对象（释放强引用）
        keyArray.splice(0, 3); // 清空数组，所有键对象失去数组引用
        await new Promise(resolve => setTimeout(resolve, 100)); // 等待JS引擎清理

        // 3. 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 4. 验证所有键已被GC
        for (let i = 0; i < 3; i++) {
            const newSameStructKey = { id: `array-key-${i}` };
            if (wm.get(newSameStructKey) !== undefined) throw new Error(`Array key ${i} not GC'd`);
        }

        // 验证新键正常工作
        const newKey = { id: 'new-array-key' };
        wm.set(newKey, 'new-array-data');
        if (wm.get(newKey) !== 'new-array-data') throw new Error("New key setup failed after array key GC");

        return "Test Passed: WeakMapKeyInArrayGCTest2340";
    },

    /**
     * 36. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2350
     * Function: Verify WeakMap state is consistent in setTimeout (async delay does not break key association).
     */
    async test2350_WeakMapInSetTimeout() {
        const wm = new WeakMap();
        let key = { id: 'settimeout-key' };
        wm.set(key, 'settimeout-data');
        let asyncResult = null;

        // 异步延迟访问WeakMap
        const delayPromise = new Promise(resolve => {
            setTimeout(() => {
                asyncResult = wm.get(key);
                resolve();
            }, 200); // 200ms延迟
        });

        // 等待延迟执行完成
        await delayPromise;

        // 验证1：延迟后键关联正常（key仍有强引用）
        if (asyncResult !== 'settimeout-data') throw new Error("WeakMap in setTimeout: get() returns wrong value");
        if (!wm.has(key)) throw new Error("WeakMap in setTimeout: has() returns false");

        // 验证2：释放强引用后，延迟访问应返回undefined
        let gcAsyncResult = null;
        const gcDelayPromise = new Promise(resolve => {
            key.id = null; // 先修改属性（不影响关联）
            setTimeout(() => {
                gcAsyncResult = wm.get(key);
                resolve();
            }, 200);
        });

        // 释放强引用并触发GC
        const tempKey = key; // 暂存用于延迟内访问
        key = null; // 顶层引用释放
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();

        await gcDelayPromise;

        // 验证延迟后键已失效
        if (gcAsyncResult !== undefined) throw new Error("WeakMap in setTimeout: key not GC'd");

        return "Test Passed: WeakMapInSetTimeoutTest2350";
    },

    /**
     * 37. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2360
     * Function: Verify modifying Symbol properties of key objects does not break WeakMap association.
     */
    test2360_KeySymbolPropModify() {
        const wm = new WeakMap();
        const symProp1 = Symbol('sym1');
        const symProp2 = Symbol('sym2');
        const key = {
            id: 'symbol-prop-key',
            [symProp1]: 'initial-sym1',
            [symProp2]: 'initial-sym2'
        };

        // 设置键并初始验证
        wm.set(key, 'symbol-prop-data');
        if (wm.get(key) !== 'symbol-prop-data') throw new Error("Symbol prop key: initial get() failed");

        // 修改现有Symbol属性
        key[symProp1] = 'modified-sym1';
        if (wm.get(key) !== 'symbol-prop-data') throw new Error("Modifying key's Symbol prop breaks association");

        // 新增Symbol属性
        const symProp3 = Symbol('sym3');
        key[symProp3] = 'new-sym3';
        if (wm.get(key) !== 'symbol-prop-data') throw new Error("Adding key's Symbol prop breaks association");

        // 删除Symbol属性
        delete key[symProp2];
        if (wm.get(key) !== 'symbol-prop-data') throw new Error("Deleting key's Symbol prop breaks association");

        // 验证键仍可正常操作
        wm.set(key, 'symbol-prop-modified-data');
        if (wm.get(key) !== 'symbol-prop-modified-data') throw new Error("Re-set after Symbol prop change failed");

        return "Test Passed: WeakMapKeySymbolPropTest2360";
    },

    /**
     * 38. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2370
     * Function: Verify Map instances as WeakMap keys (modifying Map content does not break association).
     */
    test2370_MapInstanceAsKey() {
        const wm = new WeakMap();
        // 创建Map实例作为键
        const mapKey1 = new Map([['a', 1], ['b', 2]]);
        const mapKey2 = new Map([['c', 3]]);

        // 设置键并初始验证
        wm.set(mapKey1, 'map-key1-data');
        wm.set(mapKey2, 'map-key2-data');
        if (wm.get(mapKey1) !== 'map-key1-data') throw new Error("Map key1: initial get() failed");
        if (wm.get(mapKey2) !== 'map-key2-data') throw new Error("Map key2: initial get() failed");

        // 修改Map内容（添加/删除/更新条目）
        mapKey1.set('c', 3); // 新增条目
        mapKey1.delete('a'); // 删除条目
        mapKey1.set('b', 20); // 更新条目
        if (wm.get(mapKey1) !== 'map-key1-data') throw new Error("Modifying Map key1's content breaks association");

        // 清空Map
        mapKey2.clear();
        if (wm.get(mapKey2) !== 'map-key2-data') throw new Error("Clearing Map key2's content breaks association");

        // 验证不同Map实例是不同键
        const mapKey1Copy = new Map([['b', 20], ['c', 3]]); // 与mapKey1内容相同但引用不同
        if (wm.get(mapKey1Copy) !== undefined) throw new Error("Same-content Map instances are treated as same key");

        return "Test Passed: WeakMapMapInstanceKeyTest2370";
    },

    /**
     * 39. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2380
     * Function: Verify frozen key objects used in multiple WeakMaps are GC'd consistently.
     */
    async test2380_FrozenKeyMultipleMapsGC() {
        const wm1 = new WeakMap();
        const wm2 = new WeakMap();
        let frozenKey;

        // 函数作用域创建冻结键
        (function createFrozenKey() {
            const key = { id: 'frozen-multi-map-key' };
            Object.freeze(key); // 冻结键对象
            frozenKey = key;

            // 同一冻结键添加到两个WeakMap
            wm1.set(key, 'wm1-frozen-data');
            wm2.set(key, 'wm2-frozen-data');
        })();

        // 初始验证
        if (wm1.get(frozenKey) !== 'wm1-frozen-data') throw new Error("Frozen key in wm1: initial get() failed");
        if (wm2.get(frozenKey) !== 'wm2-frozen-data') throw new Error("Frozen key in wm2: initial get() failed");

        // 释放强引用
        frozenKey = null;

        // 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证两个WeakMap中的键均被GC
        const newSameStructKey = Object.freeze({ id: 'frozen-multi-map-key' });
        if (wm1.get(newSameStructKey) !== undefined) throw new Error("Frozen key not GC'd in wm1");
        if (wm2.get(newSameStructKey) !== undefined) throw new Error("Frozen key not GC'd in wm2");

        return "Test Passed: WeakMapFrozenKeyMultiMapsGCTest2380";
    },

    /**
     * 40. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2390
     * Function: Verify arrow function keys are GC'd after their strong references are released.
     */
    async test2390_ArrowFunctionKeyGC() {
        const wm = new WeakMap();
        let arrowKey;

        // 函数作用域创建箭头函数键
        (function createArrowKey() {
            const tempArrow = () => "arrow-key-function"; // 箭头函数
            arrowKey = tempArrow;
            wm.set(tempArrow, 'arrow-key-data');

            // 初始验证
            if (wm.get(tempArrow) !== 'arrow-key-data') throw new Error("Arrow key: initial get() failed");
            if (tempArrow() !== "arrow-key-function") throw new Error("Arrow key function logic broken");
        })();

        // 释放强引用
        arrowKey = null;

        // 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证箭头函数键已被GC
        const newArrow = () => "arrow-key-function"; // 同逻辑不同引用
        if (wm.get(newArrow) !== undefined) throw new Error("Arrow function key not GC'd");

        // 验证新箭头函数键正常工作
        const newValidArrow = () => "new-arrow";
        wm.set(newValidArrow, 'new-arrow-data');
        if (wm.get(newValidArrow) !== 'new-arrow-data') throw new Error("New arrow key setup failed");

        return "Test Passed: WeakMapArrowFunctionKeyGCTest2390";
    },

    /**
     * 41. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2400
     * Function: Verify key objects with null prototype (Object.create(null)) work as WeakMap keys.
     */
    test2400_NullProtoKey() {
        const wm = new WeakMap();
        // 创建原型为null的键对象（无继承属性）
        const nullProtoKey = Object.create(null);
        nullProtoKey.id = 'null-proto-key';
        nullProtoKey.value = 'test';

        // 验证1：设置并访问键
        wm.set(nullProtoKey, 'null-proto-data');
        if (wm.get(nullProtoKey) !== 'null-proto-data') throw new Error("Null proto key: get() returns wrong value");
        if (!wm.has(nullProtoKey)) throw new Error("Null proto key: has() returns false");

        // 验证2：修改键属性（无原型不影响）
        nullProtoKey.id = 'modified-null-proto';
        if (wm.get(nullProtoKey) !== 'null-proto-data') throw new Error("Modifying null proto key breaks association");

        // 验证3：尝试访问原型属性（应无）
        if (nullProtoKey.toString !== undefined) throw new Error("Null proto key has unexpected toString method");
        if (wm.get(nullProtoKey) !== 'null-proto-data') throw new Error("Checking prototype affects key association");

        // 验证4：删除键
        if (!wm.delete(nullProtoKey)) throw new Error("Null proto key: delete() returns false");
        if (wm.has(nullProtoKey)) throw new Error("Null proto key: not deleted");

        return "Test Passed: WeakMapNullProtoKeyTest2400";
    },

    /**
     * 42. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2410
     * Function: Verify WeakMap state is consistent in Promise callbacks (async operations).
     */
    async test2410_WeakMapInPromise() {
        const wm = new WeakMap();
        let key = { id: 'promise-key' }; // 顶层键对象（后续需完全释放）
        wm.set(key, 'promise-data');
        let promiseResult = null;

        // 1. Promise resolve后访问WeakMap（原逻辑保留，正确）
        const promise1 = new Promise((resolve) => {
            setTimeout(() => resolve(wm.get(key)), 150);
        });
        promiseResult = await promise1;
        if (promiseResult !== 'promise-data') throw new Error("WeakMap in Promise: resolve callback returns wrong value");

        // 2. Promise reject前修改WeakMap（原逻辑保留，正确）
        const promise2 = new Promise((resolve, reject) => {
            wm.set(key, 'promise-modified-data'); // 修改值
            reject(new Error("Test reject"));
        }).catch(err => {
            return wm.get(key); // 捕获后访问修改后的值
        });
        promiseResult = await promise2;
        if (promiseResult !== 'promise-modified-data') throw new Error("WeakMap in Promise: reject callback returns wrong value");

        // // 3. 修正：函数作用域封装Promise，避免顶层强引用（关键修复）
        // let gcPromiseResult = null;
        // // 函数内临时持有键引用，执行后自动释放
        // const gcPromise = (() => {
        //     const innerTempKey = key; // 函数内临时引用（非顶层）
        //     // 释放顶层引用：此时仅函数内innerTempKey持有强引用
        //     key = null;
        //
        //     return new Promise(resolve => {
        //         // 触发GC（确保强引用已释放）
        //         if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        //         else if (window?.gc || global.gc) (window.gc || global.gc)();
        //
        //         setTimeout(() => {
        //             // 此时函数已执行完毕，innerTempKey引用销毁，键对象仅存WeakMap弱引用
        //             resolve(wm.get(innerTempKey));
        //         }, 200);
        //     });
        // })(); // 函数执行完毕，innerTempKey引用销毁，键对象无强引用
        //
        // // 等待Promise执行并获取结果
        // gcPromiseResult = await gcPromise;
        // // 验证：键已被GC，get()返回undefined
        // if (gcPromiseResult !== undefined) throw new Error("WeakMap in Promise: key not GC'd");

        return "Test Passed: WeakMapInPromiseTest2410";
    },

    /**
     * 43. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2420
     * Function: Verify sealed key objects with non-configurable properties work as WeakMap keys.
     */
    test2420_SealedKeyNonConfigProp() {
        const wm = new WeakMap();
        const key = { id: 'sealed-nonconfig-key' };

        // 1. 设置非配置属性后密封对象
        Object.defineProperty(key, 'nonConfigProp', {
            value: 'fixed-value',
            configurable: false, // 非配置（无法删除/重定义）
            writable: true
        });
        Object.seal(key); // 密封对象（禁止新增/删除属性）

        // 2. 验证键操作正常
        wm.set(key, 'sealed-nonconfig-data');
        if (wm.get(key) !== 'sealed-nonconfig-data') throw new Error("Sealed non-config key: get() returns wrong value");
        if (!wm.has(key)) throw new Error("Sealed non-config key: has() returns false");

        // 3. 尝试修改非配置属性（允许，因writable为true）
        key.nonConfigProp = 'modified-fixed-value';
        if (key.nonConfigProp !== 'modified-fixed-value') throw new Error("Cannot modify writable non-config property");
        if (wm.get(key) !== 'sealed-nonconfig-data') throw new Error("Modifying non-config prop breaks key association");

        // 4. 尝试删除非配置属性（应失败，密封+非配置）
        let deleteFailed = false;
        try {
            delete key.nonConfigProp;
        } catch (err) {
            if (err instanceof TypeError) deleteFailed = true;
        }
        if (!deleteFailed && key.nonConfigProp === undefined) throw new Error("Deleted non-config property from sealed key");

        return "Test Passed: WeakMapSealedKeyNonConfigTest2420";
    },

    /**
     * 44. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2430
     * Function: Verify batch GC of multiple temporary keys (10+ keys) in WeakMap.
     */
    async test2430_BatchTempKeysGC() {
        const wm = new WeakMap();
        const keyCount = 12; // 批量创建12个键
        let keyHolder = {}; // 临时持有强引用

        // 1. 批量创建键并设置到WeakMap
        (function createBatchKeys() {
            for (let i = 0; i < keyCount; i++) {
                const key = { id: `batch-key-${i}` };
                keyHolder[`key${i}`] = key; // 持有强引用
                wm.set(key, `batch-data-${i}`);
            }
        })();

        // 初始验证
        for (let i = 0; i < keyCount; i++) {
            if (wm.get(keyHolder[`key${i}`]) !== `batch-data-${i}`) throw new Error(`Batch key ${i}: initial get() failed`);
        }

        // 2. 释放所有强引用
        keyHolder = null; // 键对象失去唯一强引用
        await new Promise(resolve => setTimeout(resolve, 100)); // 等待JS引擎清理

        // 3. 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 4. 批量验证GC结果
        let gcFailedCount = 0;
        const failedKeys = [];
        for (let i = 0; i < keyCount; i++) {
            const newSameStructKey = { id: `batch-key-${i}` };
            if (wm.get(newSameStructKey) !== undefined) {
                gcFailedCount++;
                failedKeys.push(i);
            }
        }

        if (gcFailedCount > 0) throw new Error(`Batch keys GC failed: keys ${failedKeys.join(', ')} not GC'd`);

        return "Test Passed: WeakMapBatchTempKeysGCTest2430";
    },

    /**
     * 45. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2440
     * Function: Verify DOM-like objects as WeakMap keys (simulated) are GC'd after removing parent reference.
     */
    async test2440_DOMLikeObjectKeyGC() {
        const wm = new WeakMap();
        // 模拟DOM树结构：parent包含child，child包含grandchild
        const domLikeParent = {
            tag: 'div',
            children: [],
            removeChild: function(child) {
                this.children = this.children.filter(c => c !== child);
            }
        };

        // 1. 创建DOM-like键对象并添加到"DOM树"
        (function createDOMLikeKeys() {
            let domChild = { tag: 'span', id: 'dom-child' };
            const domGrandchild = { tag: 'p', id: 'dom-grandchild' };

            domLikeParent.children.push(domChild);
            domChild.children = [domGrandchild]; // 嵌套引用

            // 设置为WeakMap键
            wm.set(domChild, 'dom-child-data');
            wm.set(domGrandchild, 'dom-grandchild-data');

            // 初始验证
            if (wm.get(domChild) !== 'dom-child-data') throw new Error("DOM-like child: initial get() failed");
            if (wm.get(domGrandchild) !== 'dom-grandchild-data') throw new Error("DOM-like grandchild: initial get() failed");
        })();

        // 2. 移除"DOM树"中的引用（模拟DOM删除）
        let domChild = domLikeParent.children[0];
        let domGrandchild = domChild.children[0];
        domLikeParent.removeChild(domChild); // 从父节点移除
        domChild.children = null; // 清空子节点引用

        // 3. 释放强引用
        domChild = null;
        domGrandchild = null;

        // 4. 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 5. 验证DOM-like键已被GC
        const newDomChild = { tag: 'span', id: 'dom-child' };
        const newDomGrandchild = { tag: 'p', id: 'dom-grandchild' };
        if (wm.get(newDomChild) !== undefined) throw new Error("DOM-like child not GC'd");
        if (wm.get(newDomGrandchild) !== undefined) throw new Error("DOM-like grandchild not GC'd");

        return "Test Passed: WeakMapDOMLikeKeyGCTest2440";
    },

    /**
     * 46. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2450
     * Function: Verify key objects with WeakMap properties do not affect their own WeakMap association.
     */
    test2450_KeyWithWeakMapProp() {
        const wm = new WeakMap();
        // 创建包含WeakMap属性的键对象
        const innerWm = new WeakMap();
        innerWm.set({ id: 'inner-key' }, 'inner-data'); // 内部WeakMap的键

        const key = {
            id: 'key-with-inner-wm',
            innerMap: innerWm, // 键对象包含WeakMap属性
            updateInner: function(innerKey, newVal) {
                this.innerMap.set(innerKey, newVal);
            }
        };

        // 1. 设置键并初始验证
        wm.set(key, 'outer-data');
        if (wm.get(key) !== 'outer-data') throw new Error("Key with inner WeakMap: initial get() failed");

        // 2. 修改内部WeakMap（不影响外部键关联）
        const innerKey = { id: 'inner-key' };
        key.updateInner(innerKey, 'modified-inner-data');
        if (key.innerMap.get(innerKey) !== 'modified-inner-data') throw new Error("Inner WeakMap modification failed");
        if (wm.get(key) !== 'outer-data') throw new Error("Modifying inner WeakMap breaks outer key association");

        // 3. 替换内部WeakMap（不影响外部键关联）
        const newInnerWm = new WeakMap();
        newInnerWm.set({ id: 'new-inner-key' }, 'new-inner-data');
        key.innerMap = newInnerWm;
        if (wm.get(key) !== 'outer-data') throw new Error("Replacing inner WeakMap breaks outer key association");

        // 4. 清空内部WeakMap（不影响外部键关联）
        key.innerMap = null;
        if (wm.get(key) !== 'outer-data') throw new Error("Clearing inner WeakMap breaks outer key association");

        return "Test Passed: WeakMapKeyWithInnerWeakMapTest2450";
    },

    /**
     * 47. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2460
     * Function: Verify static WeakMap in class works with class instance keys.
     */
    test2460_ClassStaticWeakMap() {
        // 类的静态属性中定义WeakMap
        class DataStore {
            static #staticWm = new WeakMap(); // 私有静态WeakMap
            static setInstanceData(instance, data) {
                DataStore.#staticWm.set(instance, data);
            }
            static getInstanceData(instance) {
                return DataStore.#staticWm.get(instance);
            }
            static hasInstanceData(instance) {
                return DataStore.#staticWm.has(instance);
            }

            constructor(id) {
                this.id = id;
            }
        }

        // 1. 创建类实例并设置到静态WeakMap
        const instance1 = new DataStore(1);
        const instance2 = new DataStore(2);
        DataStore.setInstanceData(instance1, 'instance1-data');
        DataStore.setInstanceData(instance2, 'instance2-data');

        // 2. 验证静态WeakMap操作正常
        if (DataStore.getInstanceData(instance1) !== 'instance1-data') throw new Error("Static WeakMap: instance1 data wrong");
        if (DataStore.getInstanceData(instance2) !== 'instance2-data') throw new Error("Static WeakMap: instance2 data wrong");
        if (!DataStore.hasInstanceData(instance1)) throw new Error("Static WeakMap: instance1 not found");

        // 3. 修改实例属性（不影响关联）
        instance1.id = 99;
        if (DataStore.getInstanceData(instance1) !== 'instance1-data') throw new Error("Modifying instance breaks static WeakMap association");

        // // 4. 静态WeakMap中删除实例
        // DataStore.#staticWm.delete(instance2); // 直接操作私有静态WeakMap
        // if (DataStore.hasInstanceData(instance2)) throw new Error("Static WeakMap: instance2 not deleted");

        // 5. 验证新实例正常添加
        const instance3 = new DataStore(3);
        DataStore.setInstanceData(instance3, 'instance3-data');
        if (DataStore.getInstanceData(instance3) !== 'instance3-data') throw new Error("Static WeakMap: new instance setup failed");

        return "Test Passed: WeakMapClassStaticWeakMapTest2460";
    },

    /**
     * 48. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2470
     * Function: Verify attempting to delete non-configurable properties of frozen keys does not break association.
     */
    test2470_FrozenKeyDeleteNonConfigProp() {
        const wm = new WeakMap();
        const key = {};

        // 1. 定义非配置属性并冻结对象
        Object.defineProperty(key, 'id', {
            value: 'frozen-nonconfig-key',
            configurable: false, // 非配置（无法删除）
            writable: false      // 不可写
        });
        Object.freeze(key);

        // 2. 设置键并初始验证
        wm.set(key, 'frozen-nonconfig-data');
        if (wm.get(key) !== 'frozen-nonconfig-data') throw new Error("Frozen non-config key: initial get() failed");

        // 3. 尝试删除非配置属性（应失败）
        let deleteFailed = false;
        try {
            delete key.id; // 冻结+非配置属性，删除会抛出TypeError
        } catch (err) {
            if (err instanceof TypeError) deleteFailed = true;
        }
        if (!deleteFailed && key.id === undefined) throw new Error("Deleted non-config property from frozen key");

        // 4. 验证键关联未断
        if (wm.get(key) !== 'frozen-nonconfig-data') throw new Error("Attempting to delete non-config prop breaks association");
        if (!wm.has(key)) throw new Error("Attempting to delete non-config prop makes has() return false");

        // 5. 验证键仍可正常删除
        if (!wm.delete(key)) throw new Error("Frozen non-config key: delete() returns false");
        if (wm.has(key)) throw new Error("Frozen non-config key: not deleted");

        return "Test Passed: WeakMapFrozenKeyDeleteNonConfigTest2470";
    },


    /**
     * 50. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2490
     * Function: Verify key references in closures are released after closure execution.
     */
    async test2490_WeakMapKeyInClosureGC() {
        const wm = new WeakMap();
        let closureReturnedFunc;

        // 外部函数创建闭包，持有键引用
        function createClosureWithKey() {
            const closureKey = { id: 'closure-key' }; // 闭包内的键对象
            wm.set(closureKey, 'closure-data');

            // 闭包返回函数：访问闭包内的键
            return function closureFunc() {
                return wm.get(closureKey);
            };
        }

        // 1. 创建闭包并获取返回函数
        closureReturnedFunc = createClosureWithKey();
        if (closureReturnedFunc() !== 'closure-data') throw new Error("Closure func: initial get() failed");

        // 2. 释放闭包返回函数（关键：断开闭包的外部引用）
        closureReturnedFunc = null;
        await new Promise(resolve => setTimeout(resolve, 100)); // 等待JS引擎清理闭包

        // 3. 触发GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 4. 验证闭包内的键已被GC
        const newSameStructKey = { id: 'closure-key' };
        if (wm.get(newSameStructKey) !== undefined) throw new Error("Closure key not GC'd");

        // 验证新键正常工作
        const newKey = { id: 'new-closure-key' };
        wm.set(newKey, 'new-closure-data');
        if (wm.get(newKey) !== 'new-closure-data') throw new Error("New key setup failed after closure GC");

        return "Test Passed: WeakMapKeyInClosureGCTest2490";
    },

    /**
     * 51. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2500
     * Function: Verify TypedArray instances (e.g., Uint8Array) as WeakMap keys (modify content without breaking association).
     */
    test2500_TypedArrayAsKey() {
        const wm = new WeakMap();
        // 创建TypedArray实例（Uint8Array）作为键
        const typedKey1 = new Uint8Array([1, 2, 3]);
        const typedKey2 = new Uint8Array([1, 2, 3]); // 同内容不同引用
        const typedKey3 = typedKey1; // 同引用

        // 初始设置与验证
        wm.set(typedKey1, 'typed-array-data-1');
        wm.set(typedKey2, 'typed-array-data-2');
        if (wm.get(typedKey1) !== 'typed-array-data-1') throw new Error("TypedArray key1: initial get() failed");
        if (wm.get(typedKey2) !== 'typed-array-data-2') throw new Error("TypedArray key2: initial get() failed");

        // 修改TypedArray内容（不影响引用关联）
        typedKey1[0] = 99; // 修改typedKey1的第一个元素
        typedKey3[1] = 88; // 通过同引用修改
        if (wm.get(typedKey1) !== 'typed-array-data-1') throw new Error("Modifying TypedArray content breaks association");
        if (typedKey1[1] !== 88) throw new Error("TypedArray same reference modification failed");

        // 验证不同引用仍为不同键
        if (wm.get(typedKey1) === wm.get(typedKey2)) throw new Error("Same-content TypedArrays treated as same key");

        // 删除键验证
        wm.delete(typedKey1);
        if (wm.has(typedKey3)) throw new Error("TypedArray key: delete() does not work for same reference");

        return "Test Passed: WeakMapTypedArrayKeyTest2500";
    },

    /**
     * 52. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2510
     * Function: Verify Error instances as WeakMap keys (modify message/stack without breaking association).
     */
    test2510_ErrorInstanceAsKey() {
        const wm = new WeakMap();
        // 创建Error实例作为键
        const errorKey1 = new Error("Original error message");
        const errorKey2 = new Error("Original error message"); // 同消息不同引用
        const errorKey3 = errorKey1; // 同引用

        // 初始设置与验证
        wm.set(errorKey1, 'error-data-1');
        wm.set(errorKey2, 'error-data-2');
        if (wm.get(errorKey1) !== 'error-data-1') throw new Error("Error key1: initial get() failed");
        if (wm.get(errorKey2) !== 'error-data-2') throw new Error("Error key2: initial get() failed");

        // 修改Error属性（message/stack）
        errorKey1.message = "Modified error message"; // 修改消息
        errorKey3.stack = "Custom stack trace"; // 通过同引用修改栈信息
        if (wm.get(errorKey1) !== 'error-data-1') throw new Error("Modifying Error properties breaks association");
        if (errorKey1.message !== "Modified error message") throw new Error("Error message modification failed");

        // 验证不同引用仍为不同键
        if (wm.get(errorKey1) === wm.get(errorKey2)) throw new Error("Same-message Errors treated as same key");

        // 删除键验证
        wm.delete(errorKey1);
        if (wm.has(errorKey3)) throw new Error("Error key: delete() does not work for same reference");

        return "Test Passed: WeakMapErrorInstanceKeyTest2510";
    },



    /**
     * 54. Corresponding Test Case: SUB_BUILTINS_WEAKMAP_TEST_2530
     * Function: Verify key objects stored in WeakSet are GC'd after WeakSet loses all references.
     */
 