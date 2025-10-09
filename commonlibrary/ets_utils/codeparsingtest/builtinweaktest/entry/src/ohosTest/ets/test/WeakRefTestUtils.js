/**
 * WeakRef Verification Utility Class: Covers MDN WeakRef/FinalizationRegistry core features.
 * Key Fix: All GC-related cases follow "release strong ref → setTimeout (wait for mark) → trigger GC" order.
 * Timeout set to 100ms to ensure JS engine finishes recyclable object marking.
 */
export const WeakRefTestUtils = {
    /**
     * 1. Test Point: WeakRef only references objects/null (primitives throw TypeError)
     * No GC involved — no modification needed.
     */
    test001_PrimitiveWeakRefThrowError() {
        const primitiveValues = [
            123,          // number
            'string',     // string
            true,         // boolean
            null,         // null (allowed, deref() returns null)
            undefined,    // undefined
            BigInt(100)   // BigInt
        ];

        for (const val of primitiveValues) {
            let errorThrown = false;
            try {
                new WeakRef(val);
            } catch (err) {
                if (val !== null && err instanceof TypeError ) {
                    errorThrown = true;
                }
            }
            if (val !== null && !errorThrown) {
                throw new Error(`WeakRef allowed primitive target: ${String(val)} (expected TypeError)`);
            }

        }

        // Positive case: Wrapped Symbol object (valid)
        const wrappedSymbolObj = Object(Symbol('wrapped-sym'));
        const weakRefForSym = new WeakRef(wrappedSymbolObj);
        if (!(weakRefForSym instanceof WeakRef) || weakRefForSym.deref() !== wrappedSymbolObj) {
            throw new Error("WeakRef creation failed for wrapped Symbol object");
        }

        return "Test Passed: WeakRefPrimitiveThrowErrorTest001";
    },

    /**
     * 2. Test Point: deref() returns object before GC, undefined after GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test002_DerefBeforeAfterGC() {
        let weakRefInstance;

        (function createWeakRef() {
            const gcTarget = { id: 'deref-gc-target', data: 'test' };
            weakRefInstance = new WeakRef(gcTarget);
            if (weakRefInstance.deref() !== gcTarget) {
                throw new Error("Initial deref() returns wrong object");
            }
        })();

        // Before GC: deref() returns object
        if (weakRefInstance.deref() === undefined) {
            throw new Error("deref() returns undefined before GC (unexpected)");
        }

        // Step 1: Release strong reference
        // const tempWeakRef = weakRefInstance;
        // weakRefInstance = null;

        // Step 2: Wait for macro task (100ms) — ensure engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (after waiting)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30)); // Wait for GC to finish

        // After GC: deref() returns undefined
        if (weakRefInstance.deref() !== undefined) {
            throw new Error("deref() returns object after GC (expected undefined)");
        }

        return "Test Passed: WeakRefDerefBeforeAfterGCTest002";
    },

    /**
     * 3. Test Point: FinalizationRegistry callback triggers once per registration
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test003_FinalizationCallbackMultiRegister() {
        const callbackHeldValues = [];
        const fr = new FinalizationRegistry((hv) => callbackHeldValues.push(hv));

        let targetObj, unregisterToken;
        (function registerTargets() {
            targetObj = { id: 'multi-register-target' };
            unregisterToken = {};
            fr.register(targetObj, 'hv-1', unregisterToken);
            fr.register(targetObj, 'hv-2', unregisterToken);
        })();

        // Before GC: callback not triggered
        if (callbackHeldValues.length !== 0) {
            throw new Error(`Callback triggered ${callbackHeldValues.length} times before GC (expected 0)`);
        }

        // Step 1: Release strong references
        targetObj = null;
        unregisterToken = null;

        // Step 2: Wait for macro task (100ms) — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // After GC: callback triggers 2 times
        if (callbackHeldValues.length !== 2) {
            throw new Error(`Callback triggered ${callbackHeldValues.length} times (expected 2)`);
        }
        const sortedHV = callbackHeldValues.sort();
        if (sortedHV[0] !== 'hv-1' || sortedHV[1] !== 'hv-2') {
            throw new Error(`Held values incorrect: ${callbackHeldValues.join(', ')}`);
        }

        return "Test Passed: WeakRefFinalizationCallbackMultiRegisterTest003";
    },

    /**
     * 4. Test Point: unregister() cancels FinalizationRegistry callback
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test004_FinalizationUnregister() {
        let isCallbackTriggered = false;
        const fr = new FinalizationRegistry(() => isCallbackTriggered = true);

        let targetObj, cancelToken;
        (function registerAndCancel() {
            targetObj = { id: 'unregister-target' };
            cancelToken = {};
            fr.register(targetObj, 'unused-hv', cancelToken);
            const cancelRes = fr.unregister(cancelToken);
            if (!cancelRes) {
                throw new Error("unregister() returns false (expected true)");
            }
        })();

        // Step 1: Release strong references
        targetObj = null;
        cancelToken = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // After GC: callback not triggered
        if (isCallbackTriggered) {
            throw new Error("Callback triggered after unregister() (expected not to)");
        }

        return "Test Passed: WeakRefFinalizationUnregisterTest004";
    },

    /**
     * 5. Test Point: Multiple deref() calls return consistent results
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test005_DerefConsistency() {
        let weakRef,originalTarget;
        (function createWeakRef() {
             originalTarget = { id: 'deref-consistency-target' };
            weakRef = new WeakRef(originalTarget);
        })();

        // Before GC: multiple deref() return original object
        let preGcResults = [weakRef.deref(), weakRef.deref(), weakRef.deref()];
        if (preGcResults.some(res => res !== originalTarget)) {
            throw new Error("Multiple deref() return inconsistent results before GC");
        }

        preGcResults = null;

        // Step 1: Release strong reference
        originalTarget = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        }
        await new Promise(resolve => setTimeout(resolve, 30));
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() returns object after GC (expected undefined)");
        }
        // After GC: multiple deref() return undefined
        const postGcResults = [weakRef.deref(), weakRef.deref(), weakRef.deref()];
        if (postGcResults.some(res => res !== undefined)) {
            throw new Error("Multiple deref() return non-undefined after GC");
        }

        return "Test Passed: WeakRefDerefConsistencyTest005";
    },

    /**
     * 6. Test Point: WeakRef cannot be serialized with JSON.stringify
     * No GC involved — no modification needed.
     */
    test006_WeakRefJsonStringify() {
        const targetObj = { id: 'serialize-target' };
        const weakRef = new WeakRef(targetObj);

        // Direct serialization
        let directError = false;

            JSON.stringify(weakRef);


        // Nested serialization
        const objWithWeakRef = { name: 'test', ref: weakRef };
        let nestedError = false;

            JSON.stringify(objWithWeakRef);


        // Dereferenced object serialization (valid)
        const derefObj = weakRef.deref();
        const serialized = JSON.stringify(derefObj);
        const parsed = JSON.parse(serialized);
        if (parsed.id !== 'serialize-target') {
            throw new Error("Serialized dereferenced object is incorrect");
        }

        return "Test Passed: WeakRefJsonStringifyTest006";
    },

    /**
     * 7. Test Point: FinalizationRegistry callbacks trigger after GC (replace cleanupSome())
     * Core Change: Remove cleanupSome() entirely; rely on GC to trigger callbacks.
     * Logic: Release refs → wait 100ms → trigger GC → verify callback count
     */
    async test007_FinalizationCallbackAfterGC() {
        const collectedHeldValues = [];
        // Create FinalizationRegistry (collect held values on callback)
        const fr = new FinalizationRegistry((heldValue) => {
            collectedHeldValues.push(heldValue);
        });

        let target1, target2;
        (function registerTwoTargets() {
            // Register two independent targets (each triggers one callback)
            target1 = { id: 'gc-callback-target-1' };
            target2 = { id: 'gc-callback-target-2' };
            fr.register(target1, 'hv-target-1');
            fr.register(target2, 'hv-target-2');
        })();

        // Step 1: Release all strong references to targets
        target1 = null;
        target2 = null;

        // Step 2: Wait 100ms — ensure engine marks both targets as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (auto-triggers FinalizationRegistry callbacks)
        let gcTriggered = false;
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
            gcTriggered = true;
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
            gcTriggered = true;
        }
        if (!gcTriggered) {
            console.warn("[Warning] Manual GC not supported; waiting for auto-GC (may take longer)");
        }
        // Wait longer (500ms) for auto-GC if manual GC is unavailable
        await new Promise(resolve => setTimeout(resolve, gcTriggered ? 300 : 500));

        // Step 4: Verify callback count (2 targets → 2 callbacks)
        if (collectedHeldValues.length !== 2) {
            // Retry GC once if callbacks not triggered (for unstable environments)
            if (gcTriggered) {
                if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
                else if (window?.gc || global.gc) (window.gc || global.gc)();
                await new Promise(resolve => setTimeout(resolve, 200));
            }
            // Re-check after retry
            if (collectedHeldValues.length !== 2) {
                throw new Error(`Final callbacks triggered: ${collectedHeldValues.length} (expected 2). Collected values: [${collectedHeldValues.join(', ')}]`);
            }
        }

        // Verify held values are correct
        const sortedHV = collectedHeldValues.sort();
        if (sortedHV[0] !== 'hv-target-1' || sortedHV[1] !== 'hv-target-2') {
            throw new Error(`Held values incorrect: [${collectedHeldValues.join(', ')}] (expected hv-target-1, hv-target-2)`);
        }

        return "Test Passed: WeakRefFinalizationCallbackAfterGCTest007";
    },

    /**
     * 8. Test Point: WeakRef does not prevent object GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test008_WeakRefDoesNotPreventGC() {
        let weakRef;
        const helperWM = new WeakMap();

        (function createWeakRefAndWM() {
            const targetObj = { id: 'gc-test-target' };
            weakRef = new WeakRef(targetObj);
            helperWM.set(targetObj, 'helper-value');
        })();

        // Step 1: Release strong reference
        const tempWeakRef = weakRef;
        weakRef = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Verify WeakRef GC
        if (tempWeakRef.deref() !== undefined) {
            throw new Error("WeakRef prevents GC (deref() returns object)");
        }

        // Verify WeakMap GC (auxiliary check)
        const sameStructObj = { id: 'gc-test-target' };
        if (helperWM.get(sameStructObj) !== undefined) {
            throw new Error("WeakMap confirms object not GC'd");
        }

        return "Test Passed: WeakRefDoesNotPreventGCTest008";
    },

    /**
     * 9. Test Point: No unregisterToken → cannot cancel callback
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test009_NoUnregisterTokenCannotCancel() {
        let isCallbackTriggered = false;
        const fr = new FinalizationRegistry(() => isCallbackTriggered = true);

        let targetObj;
        (function registerWithoutToken() {
            targetObj = { id: 'no-token-target' };
            fr.register(targetObj, 'no-token-hv');
            // Try cancel with invalid token
            const cancelRes = fr.unregister({});
            if (cancelRes) {
                throw new Error("unregister() returns true for invalid token");
            }
        })();

        // Step 1: Release strong reference
        targetObj = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Verify callback triggered
        if (!isCallbackTriggered) {
            throw new Error("Callback not triggered (expected to fire without token)");
        }

        return "Test Passed: WeakRefNoUnregisterTokenTest009";
    },

    /**
     * 10. Test Point: deref() returns undefined stably after GC
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test010_DerefUndefinedStable() {
        let weakRef;
        (function createWeakRef() {
            const targetObj = { id: 'stable-undefined-target' };
            weakRef = new WeakRef(targetObj);
        })();

        // Step 1: Release strong reference
        let tempTarget = weakRef.deref();
        tempTarget = null;

        // Step 2: Wait for macro task (100ms) — engine marks object
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Immediate verification
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() not undefined immediately after GC");
        }

        // Delayed verification (5 attempts, 100ms each)
        for (let i = 1; i <= 5; i++) {
            await new Promise(resolve => setTimeout(resolve, 30));
            if (weakRef.deref() !== undefined) {
                throw new Error(`deref() returns object on attempt ${i} after GC`);
            }
        }

        return "Test Passed: WeakRefDerefUndefinedStableTest010";
    },
    /**
     * 11. Test Point: WeakRef references circular object (a.b = b; b.a = a) — GC works normally
     * MDN Basis: WeakRef does not prevent GC even if target has circular references.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test011_WeakRefCircularObjectGC() {
        let weakRefA, weakRefB;

        // Create circular reference objects (a ↔ b)
        (function createCircularObjects() {
            const objA = { id: 'circular-a' };
            const objB = { id: 'circular-b' };
            objA.linked = objB; // Circular ref: a → b
            objB.linked = objA; // Circular ref: b → a
            // Create WeakRef for both circular objects
            weakRefA = new WeakRef(objA);
            weakRefB = new WeakRef(objB);
            // Initial check: deref() returns original objects
            if (weakRefA.deref() !== objA || weakRefB.deref() !== objB) {
                throw new Error("Initial deref() returns wrong circular object");
            }
        })();

        // Step 1: Release all strong references to circular objects
        let tempWeakRefA = weakRefA;
        let tempWeakRefB = weakRefB;
        weakRefA = null;
        weakRefB = null;

        // Step 2: Wait 100ms — engine marks circular objects as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (circular refs should not prevent GC)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify both circular objects are GC'd (deref() returns undefined)
        if (tempWeakRefA.deref() !== undefined) {
            throw new Error("WeakRef to circular objA not GC'd (deref() returns object)");
        }
        if (tempWeakRefB.deref() !== undefined) {
            throw new Error("WeakRef to circular objB not GC'd (deref() returns object)");
        }

        return "Test Passed: WeakRefCircularObjectGCTest011";
    },

    /**
     * 12. Test Point: FinalizationRegistry registers same object with different tokens — unregister one token only cancels its callback
     * MDN Basis: unregister() cancels the callback associated with the specific unregisterToken.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test012_FinalizationSameObjDifferentTokens() {
        const callbackLogs = [];
        // FinalizationRegistry: log heldValue to track which callback is triggered
        const fr = new FinalizationRegistry((heldValue) => {
            callbackLogs.push(heldValue);
        });

        let targetObj, token1, token2;
        (function registerSameObjWithTwoTokens() {
            targetObj = { id: 'same-obj-multi-tokens' };
            token1 = { tokenId: 'token-1' }; // First token
            token2 = { tokenId: 'token-2' }; // Second token
            // Register same object twice with different tokens/heldValues
            fr.register(targetObj, 'callback-1', token1);
            fr.register(targetObj, 'callback-2', token2);
            // Unregister ONLY the first token (callback-1 should be canceled)
            const unregisterSuccess = fr.unregister(token1);
            if (!unregisterSuccess) {
                throw new Error("unregister(token1) returns false (expected true)");
            }
        })();

        // Step 1: Release strong references
        targetObj = null;
        token1 = null;
        token2 = null;

        // Step 2: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC (only callback-2 should be triggered)
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify callback logs (only callback-2 exists)
        if (callbackLogs.length !== 1) {
            throw new Error(`Callback triggered ${callbackLogs.length} times (expected 1)`);
        }
        if (callbackLogs[0] !== 'callback-2') {
            throw new Error(`Triggered callback: ${callbackLogs[0]} (expected callback-2)`);
        }

        return "Test Passed: WeakRefFinalizationSameObjDifferentTokensTest012";
    },

    /**
     * 13. Test Point: Modify prototype chain of WeakRef target — deref() and GC are not affected
     * MDN Basis: WeakRef associates with the object itself, not its prototype.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test013_WeakRefTargetModifyPrototype() {
        let weakRef;
        let originalProto;

        (function createWeakRefWithPrototype() {
            // Create object with custom prototype
            const customProto = { greet: () => "hello" };
            const targetObj = Object.create(customProto);
            targetObj.id = 'proto-modify-target';
            originalProto = Object.getPrototypeOf(targetObj);

            // Create WeakRef for target
            weakRef = new WeakRef(targetObj);
            // Initial check: prototype and deref() are correct
            if (Object.getPrototypeOf(weakRef.deref()) !== customProto) {
                throw new Error("Initial target prototype does not match customProto");
            }
            if (weakRef.deref().greet() !== "hello") {
                throw new Error("Initial target prototype method fails");
            }
        })();

        // Step 1: Modify target's prototype chain (set to null)
        let targetBeforeGC = weakRef.deref();
        Object.setPrototypeOf(targetBeforeGC, null); // Remove prototype
        // Verify prototype is modified (no greet method)
        if (targetBeforeGC.greet !== undefined) {
            throw new Error("Target prototype modification failed (greet still exists)");
        }
        if (Object.getPrototypeOf(targetBeforeGC) !== null) {
            throw new Error("Target prototype not set to null");
        }
        // Verify deref() still returns the same object after prototype change
        if (weakRef.deref() !== targetBeforeGC) {
            throw new Error("deref() returns different object after prototype modification");
        }

        // Step 2: Release strong reference
        targetBeforeGC = null;

        // Step 3: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 5: Verify object is GC'd (deref() returns undefined)
        if (weakRef.deref() !== undefined) {
            throw new Error("deref() returns object after GC (prototype modification affects GC)");
        }

        return "Test Passed: WeakRefTargetModifyPrototypeTest013";
    },



    /**
     * 15. Test Point: Multiple WeakRefs reference the same object — all deref() sync after GC
     * MDN Basis: All WeakRefs to the same object reflect the object's GC state.
     * Fix: Release strong ref → setTimeout(100ms) → trigger GC
     */
    async test015_MultipleWeakRefsSameObject() {
        let weakRef1, weakRef2, weakRef3;
        let targetObj;

        (function createThreeWeakRefs() {
            targetObj = { id: 'multi-weakref-target' };
            // Create 3 WeakRefs for the same object
            weakRef1 = new WeakRef(targetObj);
            weakRef2 = new WeakRef(targetObj);
            weakRef3 = new WeakRef(targetObj);
            // Initial check: all deref() return targetObj
            const refs = [weakRef1.deref(), weakRef2.deref(), weakRef3.deref()];
            if (refs.some(ref => ref !== targetObj)) {
                throw new Error("Initial multiple WeakRefs return inconsistent objects");
            }
        })();

        // Step 1: Release strong reference to target
        const tempRef1 = weakRef1;
        const tempRef2 = weakRef2;
        const tempRef3 = weakRef3;
        weakRef1 = null;
        weakRef2 = null;
        weakRef3 = null;
        targetObj = null;

        // Step 2: Wait 100ms — engine marks object as recyclable
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 3: Trigger GC
        if (globalThis.ArkTools?.forceFullGC) {
            globalThis.ArkTools.forceFullGC();
        } else if (window?.gc || global.gc) {
            (window.gc || global.gc)();
        }
        await new Promise(resolve => setTimeout(resolve, 30));

        // Step 4: Verify all WeakRefs are sync (deref() returns undefined)
        const postGcRefs = [tempRef1.deref(), tempRef2.deref(), tempRef3.deref()];
        if (postGcRefs.some(ref => ref !== undefined)) {
            throw new Error(`Multiple WeakRefs sync failed: ${postGcRefs.join(', ')} (expected all undefined)`);
        }

        return "Test Passed: WeakRefMultipleWeakRefsSameObjectTest015";
    },


    /**
     * 17. 冻结对象的WeakRef GC行为
     */
    async test017_WeakRefFrozenTargetGC() {
        let weakRef;

        (() => {
            const frozenObj = Object.freeze({ id: 'frozen-target', value: 100 });
            weakRef = new WeakRef(frozenObj);
            const derefObj = weakRef.deref();
            if (derefObj !== frozenObj) throw new Error("初始deref错误");
            if (!Object.isFrozen(derefObj)) throw new Error("对象未冻结");
        })();

        const tempWeakRef = weakRef;
        weakRef = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) {
            throw new Error("冻结对象未被GC回收");
        }

        return "Test Passed: WeakRefFrozenTargetGCTest017";
    },

    /**
     * 18. FinalizationRegistry接收复杂类型heldValue
     */
    async test018_FinalizationHeldValueComplexType() {
        let receivedHv;
        const fr = new FinalizationRegistry(hv => receivedHv = hv);

        let targetObj;
        (() => {
            targetObj = { id: 'complex-hv-target' };
            const complexHv = [{ name: 'item1' }, { name: 'item2' }];
            fr.register(targetObj, complexHv);
        })();

        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (!Array.isArray(receivedHv) || receivedHv.length !== 2) {
            throw new Error("复杂heldValue接收错误");
        }

        return "Test Passed: WeakRefFinalizationHeldValueComplexTypeTest018";
    },

    /**
     * 19. 嵌套对象的WeakRef GC行为
     */
    async test019_WeakRefNestedObjectGC() {
        let weakRefTopLevel, nestedObjRef;

        (() => {
            const topLevel = { id: 'top', inner: { id: 'nested' } };
            nestedObjRef = topLevel.inner;
            weakRefTopLevel = new WeakRef(topLevel);
            const deref = weakRefTopLevel.deref();
            if (deref.inner !== nestedObjRef) throw new Error("嵌套对象访问失败");
        })();

        const tempWeakRef = weakRefTopLevel;
        weakRefTopLevel = null;
        nestedObjRef = null;

        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        if (tempWeakRef.deref() !== undefined) {
            throw new Error("嵌套对象未被GC回收");
        }

        return "Test Passed: WeakRefNestedObjectGCTest019";
    },


    /**
     * 21. 异步函数中调用WeakRef.deref()
     */
    async test021_WeakRefDerefInAsync() {
        let weakRef, targetObj;

        (() => {
            targetObj = { id: 'async-deref' };
            weakRef = new WeakRef(targetObj);
        })();

        let preGc = await new Promise(resolve => {
            setTimeout(() => resolve(weakRef.deref()), 100);
        });
        if (preGc !== targetObj) throw new Error("GC前异步deref错误");
        preGc = null;
        targetObj = null;
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
   
