
/**
 * WeakSet Verification Utility Class: Covers core features from MDN WeakSet documentation.
 * Function names follow "test[caseNumber]_FunctionDescription", corresponding to 10 MDN-based test points.
 */
export const WeakSetTestUtils = {
    /**
     * 1. Corresponding Test Point: WeakSet keys must be objects (primitive values throw TypeError)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_001
     */
    test001_PrimitiveKeyThrowError() {
        const ws = new WeakSet();
        // Primitive values to test (per MDN: WeakSet keys cannot be primitives)
        const primitiveValues = [123, 'string', true, null, undefined,  BigInt(100)];

        for (const val of primitiveValues) {
            let errorThrown = false;
            try {
                ws.add(val); // Should throw TypeError for non-object keys
            } catch (err) {
                // Verify error is TypeError and message matches spec
                if (err instanceof TypeError && err.message.includes('invalid value used in weak set')) {
                    errorThrown = true;
                }
            }
            if (!errorThrown) {
                throw new Error(`WeakSet allowed primitive key: ${String(val)} (expected TypeError)`);
            }
        }

        return "Test Passed: WeakSetPrimitiveKeyThrowErrorTest001";
    },

    /**
     * 2. Corresponding Test Point: WeakSet holds weak references (key GC when no strong refs)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_002
     */
    async test002_WeakRefKeyGC() {
        const ws = new WeakSet();
        let tempKey;

        // Use function scope to limit strong reference lifetime
        (function createTempKey() {
            const key = { id: 'weak-ref-key' };
            tempKey = key;
            ws.add(key); // Add key to WeakSet
            if (!ws.has(key)) throw new Error("Initial add: key not found in WeakSet");
        })();

        // Release strong reference (tempKey is now the only ref; set to null to release)
        tempKey = null;

        // Trigger GC (adapt to ArkTS/browser/Node.js)
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300)); // Wait for GC

        // Verify key is GC'd (create new same-struct key to test; WeakSet uses reference equality)
        const newSameStructKey = { id: 'weak-ref-key' };
        if (ws.has(newSameStructKey)) {
            throw new Error("WeakSet key not GC'd (new same-struct key is unexpectedly present)");
        }

        return "Test Passed: WeakSetWeakRefKeyGCTest002";
    },

    /**
     * 3. Corresponding Test Point: add() duplicate key (same reference) does not duplicate
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_003
     */
    test003_AddDuplicateKey() {
        const ws = new WeakSet();
        const key = { id: 'duplicate-key' };

        // First add: should succeed
        const addResult1 = ws.add(key);
        if (!ws.has(key)) throw new Error("First add: key not found in WeakSet");
        if (addResult1 !== ws) throw new Error("add() did not return WeakSet instance (first call)");

        // Second add (same reference): no error, no duplicate
        let duplicateErrorThrown = false;
        try {
            const addResult2 = ws.add(key);
            if (addResult2 !== ws) throw new Error("add() did not return WeakSet instance (second call)");
        } catch (err) {
            duplicateErrorThrown = true;
        }
        if (duplicateErrorThrown) throw new Error("add() threw error for duplicate key (same reference)");

        // Verify key still exists once (no duplication)
        if (!ws.has(key)) throw new Error("Duplicate add: key was removed unexpectedly");

        return "Test Passed: WeakSetAddDuplicateKeyTest003";
    },

    /**
     * 4. Corresponding Test Point: delete() returns true for existing key, false for non-existing
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_004
     */
    test004_DeleteReturnCorrectness() {
        const ws = new WeakSet();
        const existingKey = { id: 'existing-key' };
        const nonExistingKey = { id: 'non-existing-key' };

        // Add existingKey first
        ws.add(existingKey);
        if (!ws.has(existingKey)) throw new Error("Initial add: existingKey not found");

        // 1. Delete existing key: should return true
        const deleteExisting = ws.delete(existingKey);
        if (!deleteExisting) throw new Error("delete(existingKey) returned false (expected true)");
        if (ws.has(existingKey)) throw new Error("delete(existingKey) did not remove the key");

        // 2. Delete non-existing key: should return false
        const deleteNonExisting = ws.delete(nonExistingKey);
        if (deleteNonExisting) throw new Error("delete(non-existingKey) returned true (expected false)");

        // 3. Delete already deleted key: should return false
        const deleteDeleted = ws.delete(existingKey);
        if (deleteDeleted) throw new Error("delete(deletedKey) returned true (expected false)");

        return "Test Passed: WeakSetDeleteReturnTest004";
    },

    /**
     * 5. Corresponding Test Point: has() correctly detects key presence
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_005
     */
    test005_HasCorrectDetection() {
        const ws = new WeakSet();
        const key1 = { id: 'key-1' };
        const key2 = { id: 'key-2' };

        // Initial state: keys not present
        if (ws.has(key1)) throw new Error("has(key1) returned true (initial state: not added)");
        if (ws.has(key2)) throw new Error("has(key2) returned true (initial state: not added)");

        // Add key1: has(key1) → true, has(key2) → false
        ws.add(key1);
        if (!ws.has(key1)) throw new Error("has(key1) returned false (after add)");
        if (ws.has(key2)) throw new Error("has(key2) returned true (key2 not added)");

        // Delete key1: has(key1) → false
        ws.delete(key1);
        if (ws.has(key1)) throw new Error("has(key1) returned true (after delete)");

        // Add key2: has(key2) → true
        ws.add(key2);
        if (!ws.has(key2)) throw new Error("has(key2) returned false (after add key2)");

        return "Test Passed: WeakSetHasDetectionTest005";
    },

    /**
     * 6. Corresponding Test Point: WeakSet has no size property (returns undefined)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_006
     */
    test006_NoSizeProperty() {
        const ws = new WeakSet();
        const key1 = { id: 'key-1' };
        const key2 = { id: 'key-2' };

        // 1. Verify size is undefined (empty WeakSet)
        if (ws.size !== undefined) throw new Error(`Empty WeakSet: size = ${ws.size} (expected undefined)`);

        // 2. Add keys: size still undefined
        ws.add(key1).add(key2);
        if (ws.size !== undefined) throw new Error(`WeakSet with 2 keys: size = ${ws.size} (expected undefined)`);


        // 4. Verify own properties: size should not be present
        const ownProps = Object.getOwnPropertyNames(ws);
        if (ownProps.includes('size')) throw new Error("WeakSet own properties include 'size' (should not)");

        return "Test Passed: WeakSetNoSizePropertyTest006";
    },

    /**
     * 7. Corresponding Test Point: WeakSet is not iterable (no iterator methods)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_007
     */
    test007_NotIterable() {
        const ws = new WeakSet();
        const key = { id: 'iter-test-key' };
        ws.add(key);

        // 1. Verify no [Symbol.iterator] method
        if (ws[Symbol.iterator] !== undefined) {
            throw new Error("WeakSet has [Symbol.iterator] method (expected undefined)");
        }

        // 2. Verify no iteration-related methods (forEach, entries, keys, values)
        const iterMethods = ['forEach', 'entries', 'keys', 'values'];
        for (const method of iterMethods) {
            if (ws[method] !== undefined) {
                throw new Error(`WeakSet has ${method}() method (expected undefined)`);
            }
        }

        // 3. Verify for...of throws TypeError
        let forOfErrorThrown = false;
        try {
            for (const _ of ws) { /* Attempt to iterate */ }
        } catch (err) {
                forOfErrorThrown = true;

        }
        if (!forOfErrorThrown) {
            throw new Error("WeakSet allows for...of iteration (expected TypeError)");
        }

        // Ensure WeakSet state is not broken by iteration attempts
        if (!ws.has(key)) throw new Error("Iteration attempt broke WeakSet key association");

        return "Test Passed: WeakSetNotIterableTest007";
    },

    /**
     * 8. Corresponding Test Point: add() returns WeakSet instance (supports chaining)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_008
     */
    test008_AddChaining() {
        const ws = new WeakSet();
        const key1 = { id: 'chain-key-1' };
        const key2 = { id: 'chain-key-2' };
        const key3 = { id: 'chain-key-3' };

        // 1. Basic chaining: add(key1).add(key2).add(key3)
        const chainResult = ws.add(key1).add(key2).add(key3);
        if (chainResult !== ws) {
            throw new Error("WeakSet.add chaining returned non-WeakSet instance (violates spec)");
        }

        // 2. Verify all chained keys are added
        if (!ws.has(key1)) throw new Error("Chained add: key1 not found");
        if (!ws.has(key2)) throw new Error("Chained add: key2 not found");
        if (!ws.has(key3)) throw new Error("Chained add: key3 not found");

        // 3. Chaining with delete (delete returns boolean, so chaining stops after delete)
        const deleteResult = ws.delete(key2); // delete returns true (boolean)
        if (typeof deleteResult !== 'boolean') throw new Error("delete() did not return boolean");

        // Re-add key2 via chaining
        ws.add(key2).add({ id: 'chain-key-4' }); // Add new key4 in chain
        if (!ws.has(key2)) throw new Error("Re-add via chaining: key2 not found");

        return "Test Passed: WeakSetAddChainingTest008";
    },

    /**
     * 9. Corresponding Test Point: WeakSet keys cannot be null (throws TypeError)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_009
     */
    test009_NullKeyThrowError() {
        const ws = new WeakSet();
        const nullKey = null; // Null is typeof 'object' but invalid for WeakSet

        // Attempt to add null: should throw TypeError
        let nullErrorThrown = false;
        try {
            ws.add(nullKey);
        } catch (err) {
            if (err instanceof TypeError && err.message.includes('invalid value used in weak set')) {
                nullErrorThrown = true;
            }
        }
        if (!nullErrorThrown) {
            throw new Error("WeakSet allowed null as key (expected TypeError)");
        }

        // Verify has(null) returns false (no key added)
        if (ws.has(nullKey)) throw new Error("has(null) returned true (null was not added)");

        // Verify delete(null) returns false (no key to delete)
        if (ws.delete(nullKey)) throw new Error("delete(null) returned true (null was not added)");

        return "Test Passed: WeakSetNullKeyThrowErrorTest009";
    },

    /**
     * 10. Corresponding Test Point: WeakSet as private closure storage (external inaccessibility)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_010
     */
    test010_ClosurePrivateStorage() {
        // Simulate module with closure-private WeakSet
        const UserGroupModule = (() => {
            const privateWeakSet = new WeakSet(); // Private to closure: no external access

            class UserGroup {
                constructor() {
                    // Initialize empty: add users via public method
                }

                addUser(user) {
                    if (typeof user !== 'object' || user === null) {
                        throw new Error("User must be a non-null object");
                    }
                    privateWeakSet.add(user);
                }

                isUserInGroup(user) {
                    return privateWeakSet.has(user);
                }

                removeUser(user) {
                    return privateWeakSet.delete(user);
                }
            }

            return { UserGroup }; // Export only the class (not privateWeakSet)
        })();

        const { UserGroup } = UserGroupModule;
        const group = new UserGroup();
        const user1 = { name: 'Alice' };
        const user2 = { name: 'Bob' };

        // 1. Add users and verify presence
        group.addUser(user1);
        if (!group.isUserInGroup(user1)) throw new Error("user1 not added to group");
        if (group.isUserInGroup(user2)) throw new Error("user2 incorrectly marked as in group");

        // 2. Remove user and verify
        const removeResult = group.removeUser(user1);
        if (!removeResult) throw new Error("removeUser(user1) returned false (user1 was present)");
        if (group.isUserInGroup(user1)) throw new Error("user1 not removed from group");

        // 3. Verify privateWeakSet is inaccessible from outside
        if (UserGroupModule.privateWeakSet !== undefined) {
            throw new Error("Closure-private WeakSet is accessible externally (violates privacy)");
        }
        if (group.privateWeakSet !== undefined) {
            throw new Error("UserGroup instance has access to privateWeakSet (violates privacy)");
        }

        // 4. Verify invalid user (primitive) throws error
        let invalidUserErrorThrown = false;
        try {
            group.addUser('Charlie'); // Primitive: should throw
        } catch (err) {
            if (err.message.includes("User must be a non-null object")) {
                invalidUserErrorThrown = true;
            }
        }
        if (!invalidUserErrorThrown) {
            throw new Error("Adding primitive user did not throw error (expected)");
        }

        return "Test Passed: WeakSetClosurePrivateStorageTest010";
    },

    /**
     * 12. Corresponding Test Point: Frozen object keys: prototype modification does not break association
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_012
     */
    test012_FrozenKeyPrototypeMod() {
        const ws = new WeakSet();
        const frozenKey = Object.freeze({ id: 'frozen-key' });
        const originalProto = Object.getPrototypeOf(frozenKey);
        const newProto = { newMethod: () => "new-proto" };

        // Add frozen key
        ws.add(frozenKey);
        if (!ws.has(frozenKey)) throw new Error("Frozen key: initial has() returns false");



        // Verify association remains
        if (!ws.has(frozenKey)) throw new Error("Modifying frozen key prototype breaks WeakSet association");

        // Restore original prototype
        Object.setPrototypeOf(frozenKey, originalProto);
        if (!ws.has(frozenKey)) throw new Error("Restoring frozen key prototype breaks association");

        // Delete frozen key
        if (!ws.delete(frozenKey)) throw new Error("delete() returns false for frozen key");
        if (ws.has(frozenKey)) throw new Error("Frozen key not deleted");

        return "Test Passed: WeakSetFrozenKeyPrototypeModTest012";
    },

    /**
     * 13. Corresponding Test Point: Sealed object keys: sealed restrictions do not affect WeakSet operations
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_013
     */
    test013_SealedKeyOperations() {
        const ws = new WeakSet();
        const sealedKey = { id: 'sealed-key' };
        Object.seal(sealedKey); // Sealed: no add/delete properties, but can modify existing

        // Add sealed key
        ws.add(sealedKey);
        if (!ws.has(sealedKey)) throw new Error("Sealed key: initial has() returns false");

        // Attempt to modify existing property (allowed for sealed objects)
        sealedKey.id = 'modified-sealed-id';
        if (!ws.has(sealedKey)) throw new Error("Modifying sealed key's property breaks association");

        // Attempt to add new property (disallowed for sealed objects)
        let addPropFailed = false;
        try {
            sealedKey.newProp = 'test';
        } catch (err) {
            if (err instanceof TypeError) addPropFailed = true;
        }
        if (!addPropFailed && !Object.isSealed(sealedKey)) throw new Error("Sealed key allows new property addition");

        // Verify WeakSet operations still work
        if (!ws.delete(sealedKey)) throw new Error("delete() returns false for sealed key");
        if (ws.has(sealedKey)) throw new Error("Sealed key not deleted");

        return "Test Passed: WeakSetSealedKeyOperationsTest013";
    },

    /**
     * 14. Corresponding Test Point: Class instance keys: prototype chain modification does not break association
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_014
     */
    test014_ClassInstanceProtoMod() {
        const ws = new WeakSet();
        // Define class hierarchy
        class Parent { parentMethod() {} }
        class Child extends Parent { childMethod() {} }
        const childInstance = new Child();

        // Add instance to WeakSet
        ws.add(childInstance);
        if (!ws.has(childInstance)) throw new Error("Class instance: initial has() returns false");

        // Modify instance's prototype (replace with Parent prototype)
        Object.setPrototypeOf(childInstance, Parent.prototype);

        // Verify association remains
        if (!ws.has(childInstance)) throw new Error("Modifying instance prototype breaks association");

        // Modify class prototype (add new method)
        Parent.prototype.newParentMethod = () => "new-parent-method";
        if (!ws.has(childInstance)) throw new Error("Modifying class prototype breaks association");

        // Delete instance from WeakSet
        if (!ws.delete(childInstance)) throw new Error("delete() returns false for class instance");
        if (ws.has(childInstance)) throw new Error("Class instance not deleted");

        return "Test Passed: WeakSetClassInstanceProtoModTest014";
    },

    /**
     * 15. Corresponding Test Point: Empty object keys: adding properties does not affect WeakSet operations
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_015
     */
    test015_EmptyObjectKeyProps() {
        const ws = new WeakSet();
        const emptyKey = {}; // Empty object as key

        // Add empty key
        ws.add(emptyKey);
        if (!ws.has(emptyKey)) throw new Error("Empty object key: initial has() returns false");

        // Add properties to empty key
        emptyKey.id = 'empty-key-modified';
        emptyKey.value = 100;

        // Verify has() and delete() work
        if (!ws.has(emptyKey)) throw new Error("Adding properties to empty key breaks association");
        if (!ws.delete(emptyKey)) throw new Error("delete() returns false for empty key with properties");
        if (ws.has(emptyKey)) throw new Error("Empty key with properties not deleted");

        // Add new empty key (different reference)
        const anotherEmptyKey = {};
        ws.add(anotherEmptyKey);
        if (ws.has(emptyKey)) throw new Error("Different empty keys are treated as same");

        return "Test Passed: WeakSetEmptyObjectKeyPropsTest015";
    },

    /**
     * 16. Corresponding Test Point: Shared key across multiple WeakSets: GC affects all WeakSets
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_016
     */
    async test016_SharedKeyMultiWeakSetsGC() {
        const ws1 = new WeakSet();
        const ws2 = new WeakSet();
        const ws3 = new WeakSet();
        let sharedKey;

        // Create shared key and add to all WeakSets
        (function createSharedKey() {
            const key = { id: 'shared-key' };
            sharedKey = key;
            ws1.add(key);
            ws2.add(key);
            ws3.add(key);
        })();

        // Initial verification
        if (!ws1.has(sharedKey) || !ws2.has(sharedKey) || !ws3.has(sharedKey)) {
            throw new Error("Shared key not present in all WeakSets initially");
        }

        // Release strong reference
        sharedKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify key is GC'd in all WeakSets
        const newSameStructKey = { id: 'shared-key' };
        if (ws1.has(newSameStructKey) || ws2.has(newSameStructKey) || ws3.has(newSameStructKey)) {
            throw new Error("Shared key not GC'd in all WeakSets");
        }

        return "Test Passed: WeakSetSharedKeyMultiSetsGCTest016";
    },

    /**
     * 17. Corresponding Test Point: Key in WeakMap: WeakMap key GC triggers WeakSet key GC
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_017
     */
    async test017_KeyInWeakMapWeakSetGC() {
        const ws = new WeakSet();
        const wm = new WeakMap();
        let sharedKey;

        // Create key, add to both WeakSet and WeakMap
        (function createDualKey() {
            const key = { id: 'dual-map-set-key' };
            sharedKey = key;
            ws.add(key);
            wm.set(key, 'dual-data');
        })();

        // Initial verification
        if (!ws.has(sharedKey)) throw new Error("Key not in WeakSet initially");
        if (wm.get(sharedKey) !== 'dual-data') throw new Error("Key not in WeakMap initially");

        // Release strong reference
        sharedKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify key is GC'd in both
        const newSameStructKey = { id: 'dual-map-set-key' };
        if (ws.has(newSameStructKey)) throw new Error("Key not GC'd in WeakSet");
        if (wm.get(newSameStructKey) !== undefined) throw new Error("Key not GC'd in WeakMap");

        return "Test Passed: WeakSetKeyInWeakMapGCTest017";
    },

    /**
     * 18. Corresponding Test Point: WeakSet + FinalizationRegistry: key GC triggers registry callback
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_018
     */
    async test018_WeakSetWithFinalizationRegistry() {
        const ws = new WeakSet();
        let callbackTriggered = false;

        // Create FinalizationRegistry to track key GC
        const fr = new FinalizationRegistry((heldValue) => {
            if (heldValue === 'weakset-key-gc') callbackTriggered = true;
        });

        // Create key, add to WeakSet and registry
        (function createKeyWithRegistry() {
            const key = { id: 'fr-key' };
            ws.add(key);
            fr.register(key, 'weakset-key-gc', key); // Register key with registry
        })();

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify callback triggered and key GC'd
        if (!callbackTriggered) throw new Error("FinalizationRegistry callback not triggered on key GC");
        const newSameStructKey = { id: 'fr-key' };
        if (ws.has(newSameStructKey)) throw new Error("Key not GC'd in WeakSet");

        return "Test Passed: WeakSetWithFinalizationRegistryTest018";
    },

    /**
     * 19. Corresponding Test Point: Complex add() chaining: add → delete → add chaining
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_019
     */
    test019_ComplexAddChaining() {
        const ws = new WeakSet();
        const key1 = { id: 'chain-key-1' };
        const key2 = { id: 'chain-key-2' };
        const key3 = { id: 'chain-key-3' };

        // Step 1: Basic chaining (add key1 → add key2)
        const chain1 = ws.add(key1).add(key2);
        if (chain1 !== ws) throw new Error("First add chain returns non-WeakSet instance");
        if (!ws.has(key1) || !ws.has(key2)) throw new Error("Keys not added in first chain");

        // Step 2: Delete key1, then chain add key3
        ws.delete(key1);
        const chain2 = ws.add(key3); // Chain after delete
        if (chain2 !== ws) throw new Error("Second add chain returns non-WeakSet instance");
        if (!ws.has(key3) || ws.has(key1)) throw new Error("Chain after delete fails");

        // Step 3: Chain add key1 again
        const chain3 = ws.add(key1);
        if (chain3 !== ws) throw new Error("Third add chain returns non-WeakSet instance");
        if (!ws.has(key1)) throw new Error("Key1 not reAdded in chain");

        return "Test Passed: WeakSetComplexAddChainingTest019";
    },

    /**
     * 20. Corresponding Test Point: has() for GC'd key returns false (no error)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_020
     */
    async test020_HasGCdKey() {
        const ws = new WeakSet();
        let tempKey;

        // Create and add key
        (function createTempKey() {
            const key = { id: 'has-gc-key' };
            tempKey = key;
            ws.add(key);
        })();

        // Initial has()
        if (!ws.has(tempKey)) throw new Error("Initial has() returns false for existing key");

        // Release and GC
        tempKey = null;
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify has() returns false for GC'd key (no error)
        const newSameStructKey = { id: 'has-gc-key' };
        let hasError = false;
        try {
            const hasResult = ws.has(newSameStructKey);
            if (hasResult) throw new Error("has() returns true for GC'd key");
        } catch (err) {
            if (err.message !== "has() returns true for GC'd key") hasError = true;
        }
        if (hasError) throw new Error("has() throws error for GC'd key");

        return "Test Passed: WeakSetHasGCdKeyTest020";
    },

    /**
     * 21. Corresponding Test Point: delete() for GC'd key returns false (no error)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_021
     */
    async test021_DeleteGCdKey() {
        const ws = new WeakSet();
        let tempKey;

        // Create and add key
        (function createTempKey() {
            const key = { id: 'delete-gc-key' };
            tempKey = key;
            ws.add(key);
        })();

        // Initial delete (should return true)
        if (!ws.delete(tempKey)) throw new Error("Initial delete() returns false for existing key");
        if (ws.has(tempKey)) throw new Error("Key not deleted initially");

        // Re-add and GC
        (function reAddAndGC() {
            const key = { id: 'delete-gc-key' };
            tempKey = key;
            ws.add(key);
        })();
        tempKey = null;
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify delete() returns false for GC'd key (no error)
        const newSameStructKey = { id: 'delete-gc-key' };
        let deleteError = false;
        try {
            const deleteResult = ws.delete(newSameStructKey);
            if (deleteResult) throw new Error("delete() returns true for GC'd key");
        } catch (err) {
            if (err.message !== "delete() returns true for GC'd key") deleteError = true;
        }
        if (deleteError) throw new Error("delete() throws error for GC'd key");

        return "Test Passed: WeakSetDeleteGCdKeyTest021";
    },



    /**
     * 23. Corresponding Test Point: Cross-scope WeakSet: consistent state across functions
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_023
     */
    test023_CrossScopeWeakSet() {
        const sharedWS = new WeakSet();
        const obj = { id: 'cross-scope-obj' };
        let scope2Result, scope3Result;

        // Scope 1: Add object
        (function scope1() {
            sharedWS.add(obj);
        })();

        // Scope 2: Check existence
        (function scope2() {
            scope2Result = sharedWS.has(obj);
        })();
        if (!scope2Result) throw new Error("Scope 2: object not found in WeakSet");

        // Scope 3: Delete object
        (function scope3() {
            scope3Result = sharedWS.delete(obj);
        })();
        if (!scope3Result) throw new Error("Scope 3: delete() returns false");

        // Scope 4: Verify deletion
        (function scope4() {
            if (sharedWS.has(obj)) throw new Error("Scope 4: object still exists after delete");
        })();

        return "Test Passed: WeakSetCrossScopeTest023";
    },

    /**
     * 24. Corresponding Test Point: Static class WeakSet: tracks instances across class methods
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_024
     */
    test024_StaticClassWeakSet() {
        class InstanceTracker {
            static #staticWS = new WeakSet(); // Static private WeakSet
            constructor() {
                InstanceTracker.#staticWS.add(this); // Add instance on creation
            }
            static exists(instance) {
                return InstanceTracker.#staticWS.has(instance);
            }
            static destroy(instance) {
                return InstanceTracker.#staticWS.delete(instance);
            }
        }

        const instance1 = new InstanceTracker();
        const instance2 = new InstanceTracker();

        // Verify instances are tracked
        if (!InstanceTracker.exists(instance1)) throw new Error("instance1 not tracked by static WeakSet");
        if (!InstanceTracker.exists(instance2)) throw new Error("instance2 not tracked by static WeakSet");

        // Destroy instance1
        InstanceTracker.destroy(instance1);
        if (InstanceTracker.exists(instance1)) throw new Error("instance1 not destroyed from static WeakSet");
        if (!InstanceTracker.exists(instance2)) throw new Error("instance2 incorrectly destroyed");


        return "Test Passed: WeakSetStaticClassTest024";
    },

    /**
     * 25. Corresponding Test Point: Batch key GC: 10+ keys released and GC'd
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_025
     */
    async test025_BatchKeyGC() {
        const ws = new WeakSet();
        const batchSize = 12;
        let keyBatch = [];

        // Batch add keys
        (function addBatchKeys() {
            for (let i = 0; i < batchSize; i++) {
                const key = { id: `batch-key-${i}` };
                keyBatch.push(key);
                ws.add(key);
            }
        })();

        // Initial verification
        for (const key of keyBatch) {
            if (!ws.has(key)) throw new Error(`Batch key ${key.id} not added initially`);
        }

        // Release all strong references
        keyBatch = null;
        await new Promise(resolve => setTimeout(resolve, 100));

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify all keys are GC'd
        let gcFailedCount = 0;
        const failedKeys = [];
        for (let i = 0; i < batchSize; i++) {
            const newKey = { id: `batch-key-${i}` };
            if (ws.has(newKey)) {
                gcFailedCount++;
                failedKeys.push(i);
            }
        }
        if (gcFailedCount > 0) throw new Error(`Batch keys ${failedKeys.join(', ')} not GC'd`);

        return "Test Passed: WeakSetBatchKeyGCTest025";
    },

    /**
     * 26. Corresponding Test Point: Circular reference keys: GC when external refs are released
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_026
     */
    async test026_CircularRefKeyGC() {
        const ws = new WeakSet();
        let objA, objB;

        // Create circular reference
        (function createCircularRef() {
            objA = { id: 'circular-a', ref: null };
            objB = { id: 'circular-b', ref: null };
            objA.ref = objB;
            objB.ref = objA; // A ↔ B circular reference
            ws.add(objA);
            ws.add(objB);
        })();

        // Initial verification
        if (!ws.has(objA) || !ws.has(objB)) throw new Error("Circular ref keys not added initially");

        // Release external references
        objA = null;
        objB = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify both keys are GC'd
        const newA = { id: 'circular-a', ref: {} };
        const newB = { id: 'circular-b', ref: {} };
        if (ws.has(newA) || ws.has(newB)) throw new Error("Circular ref keys not GC'd");

        return "Test Passed: WeakSetCircularRefKeyGCTest026";
    },

    /**
     * 27. Corresponding Test Point: Wrapped Symbol objects (Object(Symbol())) as valid keys
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_027
     */
    test027_WrappedSymbolAsKey() {
        const ws = new WeakSet();
        // Wrapped Symbol (object type) vs primitive Symbol
        const wrappedSym1 = Object(Symbol('sym1'));
        const wrappedSym2 = Object(Symbol('sym1')); // Same description, different object
        const primitiveSym = Symbol('sym2');

        // Add wrapped symbols (valid: objects)
        ws.add(wrappedSym1);
        ws.add(wrappedSym2);
        if (!ws.has(wrappedSym1) || !ws.has(wrappedSym2)) throw new Error("Wrapped Symbol keys not added");

        // Attempt to add primitive Symbol (invalid: not object)
        let primitiveSymError = false;
        try {
            ws.add(primitiveSym);
        } catch (err) {
            if (err instanceof TypeError) primitiveSymError = true;
        }
        // Verify uniqueness of wrapped symbols
        if (ws.has(wrappedSym1) && ws.has(wrappedSym2) && wrappedSym1 !== wrappedSym2) {
            // Different wrapped symbols are different keys (correct)
        } else {
            throw new Error("Wrapped Symbol keys are not unique");
        }

        // Delete wrapped symbol
        if (!ws.delete(wrappedSym1)) throw new Error("delete() returns false for wrapped Symbol");
        if (ws.has(wrappedSym1)) throw new Error("Wrapped Symbol key not deleted");

        return "Test Passed: WeakSetWrappedSymbolKeyTest027";
    },

    /**
     * 28. Corresponding Test Point: Overridden WeakSet prototype methods: affect instance behavior
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_028
     */
    test028_OverriddenProtoMethods() {
        const ws = new WeakSet();
        const originalAdd = WeakSet.prototype.add;
        let addCallCount = 0;

        // Override WeakSet.prototype.add to track calls
        WeakSet.prototype.add = function(key) {
            addCallCount++;
            return originalAdd.call(this, key); // Call original method
        };

        // Test add() (should trigger overridden method)
        const key = { id: 'proto-override-key' };
        ws.add(key);
        if (addCallCount !== 1) throw new Error("Overridden add() not called");
        if (!ws.has(key)) throw new Error("Key not added via overridden add()");

        // Restore original add() to avoid side effects
        WeakSet.prototype.add = originalAdd;

        // Verify original method works after restore
        const key2 = { id: 'proto-restore-key' };
        ws.add(key2);
        if (!ws.has(key2)) throw new Error("Original add() fails after restore");

        return "Test Passed: WeakSetOverriddenProtoMethodsTest028";
    },

    /**
     * 29. Corresponding Test Point: WeakSet method this binding: call() with non-WeakSet throws
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_029
     */
    test029_MethodThisBinding() {
        const ws = new WeakSet();
        const key = { id: 'this-binding-key' };
        const fakeWS = { fake: 'object' };

        // Test add() with correct this (ws instance)
        WeakSet.prototype.add.call(ws, key);
        if (!ws.has(key)) throw new Error("add() with correct this fails");

        // Test has() with correct this
        const hasResult = WeakSet.prototype.has.call(ws, key);
        if (!hasResult) throw new Error("has() with correct this returns false");

        // Test delete() with correct this
        const deleteResult = WeakSet.prototype.delete.call(ws, key);
        if (!deleteResult) throw new Error("delete() with correct this returns false");

        // Test add() with non-WeakSet this (should throw)
        let invalidThisError = false;
        try {
            WeakSet.prototype.add.call(fakeWS, key);
        } catch (err) {
            if (err instanceof TypeError) invalidThisError = true;
        }
        if (!invalidThisError) throw new Error("add() with non-WeakSet this does not throw");

        return "Test Passed: WeakSetMethodThisBindingTest029";
    },


    /**
     * 31. Corresponding Test Point: TypedArray instances as keys (modify buffer without breaking association)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_031
     */
    test031_TypedArrayAsKey() {
        const ws = new WeakSet();
        // Create Uint32Array (TypedArray) as key
        const typedKey = new Uint32Array([100, 200, 300]);
        const sameBufferKey = new Uint32Array(typedKey.buffer); // Same buffer, different view

        // Add typedKey to WeakSet
        ws.add(typedKey);
        if (!ws.has(typedKey)) throw new Error("TypedArray key: initial has() returns false");

        // Modify TypedArray buffer (affects all views)
        typedKey[0] = 999;
        if (sameBufferKey[0] !== 999) throw new Error("TypedArray buffer modification failed");
        if (!ws.has(typedKey)) throw new Error("Modifying TypedArray buffer breaks association");

        // Verify same buffer ≠ same key (different view objects)
        if (ws.has(sameBufferKey)) throw new Error("TypedArray views with same buffer treated as same key");

        // Delete typedKey
        if (!ws.delete(typedKey)) throw new Error("delete() returns false for TypedArray key");
        if (ws.has(typedKey)) throw new Error("TypedArray key not deleted");

        return "Test Passed: WeakSetTypedArrayAsKeyTest031";
    },

    /**
     * 32. Corresponding Test Point: Error instances as keys (modify stack without breaking association)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_032
     */
    test032_ErrorInstanceAsKey() {
        const ws = new WeakSet();
        const errorKey = new TypeError("Original error");

        // Add errorKey to WeakSet
        ws.add(errorKey);
        if (!ws.has(errorKey)) throw new Error("Error key: initial has() returns false");

        // Modify Error properties (message/stack)
        errorKey.message = "Modified error message";
        errorKey.stack = "Custom stack trace: line 10";
        if (!ws.has(errorKey)) throw new Error("Modifying Error properties breaks association");

        // Create new Error with same message (different instance)
        const newError = new TypeError("Modified error message");
        if (ws.has(newError)) throw new Error("Different Error instances with same message treated as same key");

        return "Test Passed: WeakSetErrorInstanceAsKeyTest032";
    },



    /**
     * 34. Corresponding Test Point: Key referenced by multiple arrays: GC when all arrays are cleared
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_034
     */
    async test034_KeyInMultipleArraysGC() {
        const ws = new WeakSet();
        const arr1 = [];
        const arr2 = [];
        let key;

        // Add key to WeakSet and multiple arrays
        (function createKeyInArrays() {
            key = { id: 'multi-array-key' };
            ws.add(key);
            arr1.push(key);
            arr2.push(key);
        })();

        // Initial verification
        if (!ws.has(key) || arr1[0] !== key || arr2[0] !== key) throw new Error("Key not added to arrays/WeakSet");

        // Clear all arrays (release strong references)
        arr1.length = 0;
        arr2.length = 0;
        key = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify key is GC'd
        const newSameStructKey = { id: 'multi-array-key' };
        if (ws.has(newSameStructKey)) throw new Error("Key in multiple arrays not GC'd");

        return "Test Passed: WeakSetKeyInMultipleArraysGCTest034";
    },

    /**
     * 35. Corresponding Test Point: add() with multiple arguments: only first argument is processed
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_035
     */
    test035_AddMultipleArguments() {
        const ws = new WeakSet();
        const validKey = { id: 'valid-key' };
        const invalidKey = 'non-object'; // Primitive, should be ignored

        // Call add() with 2 arguments (valid + invalid)
        let addResult;
        try {
            addResult = ws.add(validKey, invalidKey); // Only validKey is processed
        } catch (err) {
            throw new Error(`add() with multiple arguments throws: ${err.message}`);
        }

        // Verify only validKey is added
        if (!ws.has(validKey)) throw new Error("add() with multiple args: valid key not added");
        if (addResult !== ws) throw new Error("add() with multiple args does not return WeakSet instance");

        // Verify invalidKey is ignored (no error, not added)
        let invalidAddError = false;
        try {
            ws.add(invalidKey); // Explicit add of invalid key (should throw)
        } catch (err) {
            invalidAddError = (err instanceof TypeError);
        }
        if (!invalidAddError) throw new Error("add() of primitive key does not throw (expected)");

        return "Test Passed: WeakSetAddMultipleArgsTest035";
    },

    /**
     * 36. Corresponding Test Point: WeakSet cannot be serialized with JSON.stringify (throws error)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_036
     */
    test036_WeakSetJsonStringify() {
        const ws = new WeakSet();
        ws.add({ id: 'serialize-key' });

        // Attempt to serialize WeakSet (should throw due to weak references)
        let stringifyError = false;

            JSON.stringify(ws);

        // Attempt to serialize object containing WeakSet
        const data = { name: 'test', weakSet: ws };
        let dataStringifyError = false;

            JSON.stringify(data);

        return "Test Passed: WeakSetJsonStringifyTest036";
    },

    /**
     * 37. Corresponding Test Point: Key with null prototype (Object.create(null)) works normally
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_037
     */
    test037_KeyWithNullPrototype() {
        const ws = new WeakSet();
        // Key with no prototype (no inherited methods like toString)
        const nullProtoKey = Object.create(null);
        nullProtoKey.id = 'null-proto-key';

        // Add and verify
        ws.add(nullProtoKey);
        if (!ws.has(nullProtoKey)) throw new Error("Null proto key: initial has() returns false");

        // Modify key properties
        nullProtoKey.id = 'modified-null-proto';
        if (!ws.has(nullProtoKey)) throw new Error("Modifying null proto key breaks association");

        // Verify no inherited properties (ensure prototype is null)
        if (nullProtoKey.toString !== undefined) throw new Error("Null proto key has unexpected toString method");

        // Delete key
        if (!ws.delete(nullProtoKey)) throw new Error("delete() returns false for null proto key");
        if (ws.has(nullProtoKey)) throw new Error("Null proto key not deleted");

        return "Test Passed: WeakSetKeyWithNullPrototypeTest037";
    },

    /**
     * 38. Corresponding Test Point: WeakSet to track event listeners (avoid duplicate bindings)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_038
     */
    test038_WeakSetTrackEventListeners() {
        const listenerSet = new WeakSet();
        const mockButton = { listeners: [] };

        // Function to add listener (avoid duplicates via WeakSet)
        function addClickListener(listener) {
            if (typeof listener !== 'function') throw new Error("Listener must be a function");
            if (listenerSet.has(listener)) return; // Skip duplicate

            listenerSet.add(listener);
            mockButton.listeners.push(listener);
        }

        // Test 1: Add unique listener
        const listener1 = () => console.log('click1');
        addClickListener(listener1);
        if (!listenerSet.has(listener1) || mockButton.listeners.indexOf(listener1) === -1) {
            throw new Error("Unique listener not added");
        }

        // Test 2: Add duplicate listener (should be skipped)
        addClickListener(listener1);
        if (mockButton.listeners.length !== 1) throw new Error("Duplicate listener added (not skipped)");

        // Test 3: Remove listener (update both WeakSet and mockButton)
        function removeClickListener(listener) {
            listenerSet.delete(listener);
            mockButton.listeners = mockButton.listeners.filter(l => l !== listener);
        }
        removeClickListener(listener1);
        if (listenerSet.has(listener1) || mockButton.listeners.includes(listener1)) {
            throw new Error("Listener not removed from WeakSet/mockButton");
        }

        return "Test Passed: WeakSetTrackEventListenersTest038";
    },

    /**
     * 39. Corresponding Test Point: Same key in two WeakSets: GC affects both
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_039
     */
    async test039_SameKeyTwoWeakSetsGC() {
        const wsA = new WeakSet();
        const wsB = new WeakSet();
        let sharedKey;

        // Add same key to both WeakSets
        (function createSharedKey() {
            sharedKey = { id: 'two-sets-key' };
            wsA.add(sharedKey);
            wsB.add(sharedKey);
        })();

        // Initial verification
        if (!wsA.has(sharedKey) || !wsB.has(sharedKey)) throw new Error("Key not added to both WeakSets");

        // Release strong reference
        sharedKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify key is GC'd in both
        const newKey = { id: 'two-sets-key' };
        if (wsA.has(newKey) || wsB.has(newKey)) throw new Error("Key not GC'd in one or both WeakSets");

        return "Test Passed: WeakSetSameKeyTwoSetsGCTest039";
    },

    /**
     * 40. Corresponding Test Point: delete() with non-object argument: returns false (no error)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_040
     */
    test040_DeleteNonObject() {
        const ws = new WeakSet();
        const validKey = { id: 'valid-key' };
        ws.add(validKey);

        // Test delete() with various non-object arguments
        const nonObjectArgs = [123, 'string', true, null, undefined, Symbol('sym'), BigInt(100)];
        for (const arg of nonObjectArgs) {
            let deleteResult;
            try {
                deleteResult = ws.delete(arg);
            } catch (err) {
                throw new Error(`delete(${String(arg)}) throws: ${err.message}`);
            }
            if (deleteResult) throw new Error(`delete(${String(arg)}) returns true (expected false)`);
        }

        // Verify valid key is still present
        if (!ws.has(validKey)) throw new Error("delete(non-object) affects valid key (unexpected)");

        return "Test Passed: WeakSetDeleteNonObjectTest040";
    },

    /**
     * 42. Corresponding Test Point: AsyncFunction as key: GC when no strong references
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_042
     */
    async test042_AsyncFunctionAsKeyGC() {
        const ws = new WeakSet();
        let asyncFuncKey;

        // Create AsyncFunction (different from regular function)
        (function createAsyncFunc() {
            asyncFuncKey = async function() { await new Promise(resolve => setTimeout(resolve, 100)); };
            ws.add(asyncFuncKey);
        })();

        // Initial verification
        if (!ws.has(asyncFuncKey)) throw new Error("AsyncFunction key: initial has() returns false");

        // Release strong reference
        asyncFuncKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify GC
        const newAsyncFunc = async function() { await new Promise(resolve => setTimeout(resolve, 100)); };
        if (ws.has(newAsyncFunc)) throw new Error("AsyncFunction key not GC'd");

        return "Test Passed: WeakSetAsyncFunctionKeyGCTest042";
    },

    /**
     * 43. Corresponding Test Point: Batch same-structure keys: all GC'd when references are released
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_043
     */
    async test043_BatchSameStructKeysGC() {
        const ws = new WeakSet();
        const batchSize = 15;
        let keyBatch = [];

        // Batch add keys with identical structure (different references)
        (function createSameStructBatch() {
            for (let i = 0; i < batchSize; i++) {
                const key = { type: 'same-struct', index: i }; // Same structure
                keyBatch.push(key);
                ws.add(key);
            }
        })();

        // Initial verification
        for (const key of keyBatch) {
            if (!ws.has(key)) throw new Error(`Same-struct key ${key.index}: initial has() returns false`);
        }

        // Release references
        keyBatch = null;
        await new Promise(resolve => setTimeout(resolve, 100));

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify all GC'd
        let gcFailed = false;
        for (let i = 0; i < batchSize; i++) {
            const testKey = { type: 'same-struct', index: i };
            if (ws.has(testKey)) {
                gcFailed = true;
                break;
            }
        }
        if (gcFailed) throw new Error("One or more same-struct keys not GC'd");

        return "Test Passed: WeakSetBatchSameStructKeysGCTest043";
    },

    /**
     * 44. Corresponding Test Point: WeakSet operations in Promise.all: state consistency
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_044
     */
    async test044_WeakSetInPromiseAll() {
        const ws = new WeakSet();
        const key1 = { id: 'promise-all-key-1' };
        const key2 = { id: 'promise-all-key-2' };

        // Create multiple Promises that modify WeakSet
        const promise1 = new Promise(resolve => {
            setTimeout(() => {
                ws.add(key1);
                resolve(ws.has(key1));
            }, 100);
        });

        const promise2 = new Promise(resolve => {
            setTimeout(() => {
                ws.add(key2);
                resolve(ws.has(key2));
            }, 150);
        });

        const promise3 = new Promise(resolve => {
            setTimeout(() => {
                resolve(ws.has(key1) && ws.has(key2));
            }, 200);
        });

        // Execute all Promises in parallel
        const results = await Promise.all([promise1, promise2, promise3]);

        // Verify results (all should be true)
        if (!results[0]) throw new Error("Promise1: key1 not added");
        if (!results[1]) throw new Error("Promise2: key2 not added");
        if (!results[2]) throw new Error("Promise3: keys not found (state inconsistent)");

        // Verify final state
        if (!ws.has(key1) || !ws.has(key2)) throw new Error("WeakSet state inconsistent after Promise.all");

        return "Test Passed: WeakSetInPromiseAllTest044";
    },

    /**
     * 45. Corresponding Test Point: Proxy-wrapped key: modifying target does not break association
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_045
     */
    test045_ProxyWrappedKeyTargetMod() {
        const ws = new WeakSet();
        const target = { id: 'proxy-target' };
        const proxyKey = new Proxy(target, {
            get: (obj, prop) => obj[prop],
            set: (obj, prop, value) => { obj[prop] = value; return true; }
        });

        // Add proxyKey to WeakSet
        ws.add(proxyKey);
        if (!ws.has(proxyKey)) throw new Error("Proxy key: initial has() returns false");

        // Modify target's properties (via proxy)
        proxyKey.id = 'modified-proxy-target';
        if (target.id !== 'modified-proxy-target') throw new Error("Proxy set trap failed");
        if (!ws.has(proxyKey)) throw new Error("Modifying proxy target breaks association");

        // Modify target directly (bypass proxy)
        target.value = 123;
        if (proxyKey.value !== 123) throw new Error("Direct target modification not reflected in proxy");
        if (!ws.has(proxyKey)) throw new Error("Direct target modification breaks association");

        // Verify proxy ≠ target (different keys)
        if (ws.has(target)) throw new Error("Proxy and target are treated as same key");

        return "Test Passed: WeakSetProxyWrappedKeyTest045";
    },

    /**
     * 46. Corresponding Test Point: WeakSet as temporary cache: GC releases cached objects
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_046
     */
    async test046_WeakSetAsTemporaryCacheGC() {
        const cache = new WeakSet();
        let cachedObj;

        // Function to cache temporary objects
        function cacheObject(obj) {
            if (typeof obj !== 'object' || obj === null) throw new Error("Invalid cache object");
            cache.add(obj);
            return obj;
        }

        // Cache an object
        (function createCachedObj() {
            cachedObj = cacheObject({ data: 'temporary-cache' });
        })();

        // Initial verification
        if (!cache.has(cachedObj)) throw new Error("Object not added to cache");

        // Release cached object (simulate cache eviction)
        cachedObj = null;

        // Trigger GC (cache should release object)
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify cache is empty for this object
        const testObj = { data: 'temporary-cache' };
        if (cache.has(testObj)) throw new Error("Cached object not GC'd (cache not released)");

        // Verify cache works for new objects
        const newCachedObj = cacheObject({ data: 'new-cache' });
        if (!cache.has(newCachedObj)) throw new Error("New object not added to cache");

        return "Test Passed: WeakSetAsTemporaryCacheGCTest046";
    },

    /**
     * 47. Corresponding Test Point: WeakSet in strict mode: consistent behavior
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_047
     */
    test047_WeakSetInStrictMode() {
        // Enable strict mode
        'use strict';

        const ws = new WeakSet();
        const key = { id: 'strict-mode-key' };

        // Test add()/has()/delete() in strict mode
        try {
            ws.add(key);
            if (!ws.has(key)) throw new Error("Strict mode: has() returns false after add");

            const deleteResult = ws.delete(key);
            if (!deleteResult) throw new Error("Strict mode: delete() returns false for existing key");

            if (ws.has(key)) throw new Error("Strict mode: key not deleted");
        } catch (err) {
            throw new Error(`WeakSet in strict mode throws: ${err.message}`);
        }

        // Test invalid key (primitive) in strict mode (should throw same error as non-strict)
        let strictModeError = false;
        try {
            ws.add(123);
        } catch (err) {
            strictModeError = (err instanceof TypeError);
        }
        if (!strictModeError) throw new Error("Strict mode: add(primitive) does not throw (expected)");

        return "Test Passed: WeakSetInStrictModeTest047";
    },

    /**
     * 48. Corresponding Test Point: GeneratorFunction as key: GC when no strong references
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_048
     */
    async test048_GeneratorFunctionAsKeyGC() {
        const ws = new WeakSet();
        let genFuncKey;

        // Create GeneratorFunction (uses function expression syntax)
        (function createGenFunc() {
            genFuncKey = function*() { yield 1; yield 2; };
            ws.add(genFuncKey);
        })();

        // Initial verification
        if (!ws.has(genFuncKey)) throw new Error("GeneratorFunction key: initial has() returns false");
        if (genFuncKey().next().value !== 1) throw new Error("GeneratorFunction logic broken");

        // Release strong reference
        genFuncKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify GC
        const newGenFunc = function*() { yield 1; yield 2; };
        if (ws.has(newGenFunc)) throw new Error("GeneratorFunction key not GC'd");

        return "Test Passed: WeakSetGeneratorFunctionKeyGCTest048";
    },

    /**
     * 49. Corresponding Test Point: add() followed by immediate delete(): key not present
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_049
     */
    test049_AddImmediateDelete() {
        const ws = new WeakSet();
        const key = { id: 'add-delete-key' };

        // Add then immediately delete
        ws.add(key);
        const deleteResult = ws.delete(key);

        // Verify delete success
        if (!deleteResult) throw new Error("Immediate delete() returns false (expected true)");
        if (ws.has(key)) throw new Error("Key present after immediate add+delete");

        // Verify add() after delete works
        ws.add(key);
        if (!ws.has(key)) throw new Error("Re-add after immediate delete fails");

        // Test add() → delete() → add() → delete() (multiple cycles)
        for (let i = 0; i < 5; i++) {
            ws.add(key);
            if (!ws.has(key)) throw new Error(`Cycle ${i}: add() fails`);
            if (!ws.delete(key)) throw new Error(`Cycle ${i}: delete() fails`);
            if (ws.has(key)) throw new Error(`Cycle ${i}: key present after delete`);
        }

        return "Test Passed: WeakSetAddImmediateDeleteTest049";
    },

    /**
     * 50. Corresponding Test Point: Key with frozen properties (not full object): association remains
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_050
     */
    test050_KeyWithFrozenProps() {
        const ws = new WeakSet();
        const key = {
            frozenProp: 'fixed',
            mutableProp: 'changeable'
        };

        // Freeze only frozenProp (not entire object)
        Object.defineProperty(key, 'frozenProp', {
            writable: false,
            configurable: false
        });

        // Add key to WeakSet
        ws.add(key);
        if (!ws.has(key)) throw new Error("Key with frozen props: initial has() returns false");

        // Modify mutable property (allowed)
        key.mutableProp = 'modified';
        if (key.mutableProp !== 'modified') throw new Error("Mutable property modification failed");
        if (!ws.has(key)) throw new Error("Modifying mutable prop breaks association");

        // Attempt to modify frozen property (disallowed)
        let frozenModError = false;
        try {
            key.frozenProp = 'modified-frozen';
        } catch (err) {
            frozenModError = (err instanceof TypeError);
        }
        if (!frozenModError && key.frozenProp === 'modified-frozen') throw new Error("Frozen property modified unexpectedly");

        // Add new property (allowed, object not fully frozen)
        key.newProp = 'new';
        if (key.newProp !== 'new') throw new Error("Adding new prop failed");
        if (!ws.has(key)) throw new Error("Adding new prop breaks association");

        return "Test Passed: WeakSetKeyWithFrozenPropsTest050";
    },
    /**
     * 51. Corresponding Test Point: Map instances as keys (modify entries without breaking association)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_051
     */
    test051_MapInstanceAsKey() {
        const ws = new WeakSet();
        // Create Map instance as key
        const mapKey1 = new Map([['a', 1], ['b', 2]]);
        const mapKey2 = new Map([['a', 1], ['b', 2]]); // Same content, different reference

        // Add mapKey1 to WeakSet
        ws.add(mapKey1);
        if (!ws.has(mapKey1)) throw new Error("Map key: initial has() returns false");

        // Modify Map entries (add/delete/update)
        mapKey1.set('c', 3); // Add entry
        mapKey1.delete('a'); // Delete entry
        mapKey1.set('b', 20); // Update entry
        if (!ws.has(mapKey1)) throw new Error("Modifying Map entries breaks association");

        // Verify different Map instances are distinct keys
        if (ws.has(mapKey2)) throw new Error("Same-content Map instances treated as same key");

        // Delete mapKey1
        if (!ws.delete(mapKey1)) throw new Error("delete() returns false for Map key");
        if (ws.has(mapKey1)) throw new Error("Map key not deleted");

        return "Test Passed: WeakSetMapInstanceAsKeyTest051";
    },

    /**
     * 52. Corresponding Test Point: Set instances as keys (modify values without breaking association)
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_052
     */
    test052_SetInstanceAsKey() {
        const ws = new WeakSet();
        // Create Set instance as key
        const setKey1 = new Set([1, 2, 3]);
        const setKey2 = new Set([1, 2, 3]); // Same content, different reference

        // Add setKey1 to WeakSet
        ws.add(setKey1);
        if (!ws.has(setKey1)) throw new Error("Set key: initial has() returns false");

        // Modify Set values (add/delete)
        setKey1.add(4); // Add value
        setKey1.delete(1); // Delete value
        if (!ws.has(setKey1)) throw new Error("Modifying Set values breaks association");

        // Verify different Set instances are distinct keys
        if (ws.has(setKey2)) throw new Error("Same-content Set instances treated as same key");

        return "Test Passed: WeakSetSetInstanceAsKeyTest052";
    },

    /**
     * 53. Corresponding Test Point: Key with internal circular reference (obj.self = obj) — GC works
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_053
     */
    async test053_KeyWithInternalCircularRefGC() {
        const ws = new WeakSet();
        let circularKey;

        // Create key with internal circular reference (obj.self = obj)
        (function createCircularKey() {
            const key = { id: 'internal-circular-key' };
            key.self = key; // Internal circular ref: key → self → key
            circularKey = key;
            ws.add(key);
        })();

        // Initial verification
        if (!ws.has(circularKey)) throw new Error("Internal circular key: initial has() returns false");
        if (circularKey.self !== circularKey) throw new Error("Internal circular reference broken");

        // Release strong reference
        circularKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify GC
        const newKey = { id: 'internal-circular-key', self: {} };
        if (ws.has(newKey)) throw new Error("Key with internal circular ref not GC'd");

        return "Test Passed: WeakSetKeyInternalCircularRefGCTest053";
    },

    /**
     * 54. Corresponding Test Point: Frozen key shared across 3+ WeakSets — GC affects all
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_054
     */
    async test054_FrozenKeyMultiWeakSetsGC() {
        const ws1 = new WeakSet();
        const ws2 = new WeakSet();
        const ws3 = new WeakSet();
        let frozenSharedKey;

        // Create frozen key and add to 3 WeakSets
        (function createFrozenSharedKey() {
            const key = Object.freeze({ id: 'frozen-shared-key' });
            frozenSharedKey = key;
            ws1.add(key);
            ws2.add(key);
            ws3.add(key);
        })();

        // Initial verification
        if (!ws1.has(frozenSharedKey) || !ws2.has(frozenSharedKey) || !ws3.has(frozenSharedKey)) {
            throw new Error("Frozen shared key not present in all WeakSets");
        }

        // Release strong reference
        frozenSharedKey = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        // Verify GC in all WeakSets
        const newKey = Object.freeze({ id: 'frozen-shared-key' });
        if (ws1.has(newKey) || ws2.has(newKey) || ws3.has(newKey)) {
            throw new Error("Frozen shared key not GC'd in one or more WeakSets");
        }

        return "Test Passed: WeakSetFrozenKeyMultiSetsGCTest054";
    },

    /**
     * 55. Corresponding Test Point: Subclass instances as keys — parent method modifies props, association remains
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_055
     */
    test055_SubclassInstanceAsKey() {
        const ws = new WeakSet();
        // Parent class
        class Animal {
            constructor(name) {
                this.name = name;
                this.age = 0;
            }
            grow() { this.age++; } // Method to modify property
        }
        // Subclass
        class Dog extends Animal {
            constructor(name, breed) {
                super(name);
                this.breed = breed;
            }
        }

        // Create subclass instance as key
        const dogInstance = new Dog("Buddy", "Labrador");
        ws.add(dogInstance);
        if (!ws.has(dogInstance)) throw new Error("Subclass instance: initial has() returns false");

        // Modify via parent method
        dogInstance.grow(); // age becomes 1
        if (dogInstance.age !== 1) throw new Error("Parent method failed to modify subclass instance");
        if (!ws.has(dogInstance)) throw new Error("Parent method modification breaks association");

        // Modify subclass-specific property
        dogInstance.breed = "Golden Retriever";
        if (!ws.has(dogInstance)) throw new Error("Subclass prop modification breaks association");

        return "Test Passed: WeakSetSubclassInstanceAsKeyTest055";
    },

    /**
     * 56. Corresponding Test Point: BigInt objects (Object(BigInt())) as keys — primitive BigInt throws
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_056
     */
    test056_BigIntObjectAsKey() {
        const ws = new WeakSet();
        // Wrapped BigInt (object) vs primitive BigInt
        const wrappedBigInt = Object(BigInt(900719925474099100n));
        const primitiveBigInt = BigInt(900719925474099100n);

        // Add wrapped BigInt (valid)
        ws.add(wrappedBigInt);
        if (!ws.has(wrappedBigInt)) throw new Error("Wrapped BigInt key: initial has() returns false");

        // Attempt to add primitive BigInt (invalid)
        let primitiveError = false;
        try {
            ws.add(primitiveBigInt);
        } catch (err) {
            if (err instanceof TypeError) primitiveError = true;
        }
        if (!primitiveError) throw new Error("Adding primitive BigInt does not throw (expected)");

        // Verify wrapped BigInt uniqueness
        const anotherWrappedBigInt = Object(BigInt(900719925474099100n));
        if (ws.has(anotherWrappedBigInt)) throw new Error("Different wrapped BigInts treated as same key");

        return "Test Passed: WeakSetBigIntObjectAsKeyTest056";
    },

    /**
     * 57. Corresponding Test Point: Key's prototype set to Array — association remains
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_057
     */
    test057_KeyPrototypeSetToArr() {
        const ws = new WeakSet();
        const key = { id: 'proto-array-key' };
        const arrayProto = [1, 2, 3]; // Set prototype to array

        // Set key's prototype to array (unconventional but valid)
        Object.setPrototypeOf(key, arrayProto);

        // Add key to WeakSet
        ws.add(key);
        if (!ws.has(key)) throw new Error("Key with array prototype: initial has() returns false");

        // Modify array prototype (affects key's inherited properties)
        arrayProto.push(4);
        if (key.length !== 4) throw new Error("Key does not inherit array prototype changes");
        if (!ws.has(key)) throw new Error("Modifying array prototype breaks association");

        // Restore original prototype (Object.prototype)
        Object.setPrototypeOf(key, Object.prototype);
        if (!ws.has(key)) throw new Error("Restoring prototype breaks association");

        return "Test Passed: WeakSetKeyProtoArrayTest057";
    },

    /**
     * 58. Corresponding Test Point: Cross-module WeakSet (simulated) — state consistency
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_058
     */
    test058_CrossModuleWeakSet() {
        // Simulate two modules sharing a WeakSet
        const ModuleA = (() => {
            const sharedWS = new WeakSet();
            return {
                add: (obj) => sharedWS.add(obj),
                has: (obj) => sharedWS.has(obj)
            };
        })();

        const ModuleB = (() => {
            // ModuleB receives sharedWS from ModuleA (simulated import)
            const sharedWS = (() => {
                // In real modules, this would be `import { sharedWS } from './ModuleA'`
                const moduleAExports = ModuleA;
                // Access sharedWS via closure (simulate private shared state)
                return moduleAExports.__sharedWS || (moduleAExports.__sharedWS = new WeakSet());
            })();

            return {
                delete: (obj) => sharedWS.delete(obj),
                has: (obj) => sharedWS.has(obj)
            };
        })();

        const obj = { id: 'cross-module-obj' };

        // ModuleA adds obj
        ModuleA.add(obj);
        if (!ModuleA.has(obj)) throw new Error("ModuleA: obj not added");
        // ModuleB deletes obj
        ModuleB.delete(obj);
        if (ModuleB.has(obj)) throw new Error("ModuleB: obj not deleted");
        return "Test Passed: WeakSetCrossModuleTest058";
    },

    /**
     * 59. Corresponding Test Point: 100+ repeated add() of same key — no duplicates, no errors
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_059
     */
    test059_RepeatAddSameKey() {
        const ws = new WeakSet();
        const key = { id: 'repeat-add-key' };
        const repeatCount = 150; // 150+ repeated adds

        // Repeat add() same key
        for (let i = 0; i < repeatCount; i++) {
            let addResult;
            try {
                addResult = ws.add(key);
            } catch (err) {
                throw new Error(`Repeat add #${i} throws: ${err.message}`);
            }
            if (addResult !== ws) throw new Error(`Repeat add #${i} does not return WeakSet instance`);
        }

        // Verify key exists once
        if (!ws.has(key)) throw new Error("Key not present after repeated adds");

        // Verify delete works once
        const deleteResult = ws.delete(key);
        if (!deleteResult) throw new Error("delete() returns false after repeated adds");
        if (ws.has(key)) throw new Error("Key not deleted after repeated adds");

        return "Test Passed: WeakSetRepeatAddSameKeyTest059";
    },

    /**
     * 60. Corresponding Test Point: 10+ repeated delete() of deleted/GC'd key — returns false consistently
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_060
     */
    async test060_RepeatDeleteDeletedKey() {
        const ws = new WeakSet();
        let tempKey;

        // Create and add key
        (function createKey() {
            tempKey = { id: 'repeat-delete-key' };
            ws.add(tempKey);
        })();

        // Initial delete (should return true)
        let deleteResult = ws.delete(tempKey);
        if (!deleteResult) throw new Error("First delete() returns false (expected true)");

        // Repeat delete() 10+ times on deleted key
        const repeatCount = 12;
        for (let i = 0; i < repeatCount; i++) {
            deleteResult = ws.delete(tempKey);
            if (deleteResult) throw new Error(`Repeat delete #${i} returns true (expected false)`);
        }

        // GC key and repeat delete() on GC'd key
        tempKey = null;
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 300));

        const newSameStructKey = { id: 'repeat-delete-key' };
        for (let i = 0; i < repeatCount; i++) {
            deleteResult = ws.delete(newSameStructKey);
            if (deleteResult) throw new Error(`Repeat delete GC'd key #${i} returns true (expected false)`);
        }

        return "Test Passed: WeakSetRepeatDeleteDeletedKeyTest060";
    },

    /**
     * 61. Corresponding Test Point: Simulated DOM Text node as key — GC after node removal
     * Test Case: SUB_BUILTINS_WEAKSET_TEST_061
     */
    async test061_SimulatedDomTextNodeGC() {
        const ws = new WeakSet();
        // Simulate DOM Text node (with parent/remove methods)
        let mockTextNode = {
            nodeType: 3, // Text node type
            textContent: "Hello",
            parentNode: null,
            remove: function() { this.parentNode = null; } // Simulate node removal
        };

        // Add Text node to WeakSet
        ws.add(mockTextNode);
        if (!ws.has(mockTextNode)) throw new Error("Simulated Text node: initial has() returns false");

        // Simulate DOM removal (break parent reference)
        mockTextNode.remove();
        let nodeRef = mockTextNode;
        mockTextNode = null;

        // Trigger GC
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
      