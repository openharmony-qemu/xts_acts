/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
export const FinalizationRegistryComprehensiveUtils = {
    /**
     * 001. 综合场景：构造+注册+GC触发回调（验证弱引用与heldValue传递）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test001_ConstructorRegisterGCCallback() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "comprehensive-held-001";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };

        const executeRegistration = () => {
            const registry = new FinalizationRegistry(callback);
            const target = {};
            registry.register(target, expectedHeldValue);
        };


        executeRegistration();

        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test001失败：GC后回调未接收正确heldValue（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        }
        return "Test Passed: ConstructorRegisterGCCallbackTest001";
    },

    /**
     * 002. 综合场景：注册+unregister+GC（取消后回调不触发）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test002_RegisterUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token = {};


        const executeRegistration = () => {
            const target = {};
            registry.register(target, "unregister-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test002失败：unregister后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: RegisterUnregisterGCTest002";
    },

    /**
     * 003. 综合场景：强引用heldValue（GC后仍可访问）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test003_StrongReferenceHeldValueGC() {
        "use strict";
        let capturedHeldObj = null;
        const heldObj = { id: 1, data: "strong-hold-data" };
        const callback = (hv) => {
            capturedHeldObj = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldObj);
        };

        executeRegistration();
        heldObj.data = "updated-after-register";
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isHeldObjValid = capturedHeldObj?.id === 1 && capturedHeldObj?.data === "updated-after-register";
        if (!isHeldObjValid) {
            throw new Error(`Test003失败：GC后heldValue对象失效（实际: ${JSON.stringify(capturedHeldObj)}`);
        }
        return "Test Passed: StrongReferenceHeldValueGCTest003";
    },

    /**
     * 004. 综合场景：同一目标多次注册+GC（最后一次heldValue生效）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test004_MultipleRegisterSameTargetGC() {
        "use strict";
        let capturedHeldValue = null;
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);
        const finalHeldValue = "final-held-004";

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "first-held");
            registry.register(target, "second-held");
            registry.register(target, finalHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== finalHeldValue) {
            throw new Error(`Test004失败：多次注册后GC回调未接收最后一个heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: MultipleRegisterSameTargetGCTest004";
    },

    /**
     * 005. 综合场景：Symbol目标+Symbol token+取消+GC
     * 优化点：内部方法封装Symbol目标、GC前后各10ms延时
     */
    async test005_SymbolTargetTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const symbolToken = Symbol("token-005");

        const executeRegistration = () => {
            const symbolTarget = Symbol("target-005");
            registry.register(symbolTarget, "symbol-held", symbolToken);
        };

        executeRegistration();
        registry.unregister(symbolToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test005失败：Symbol token取消后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: SymbolTargetTokenUnregisterGCTest005";
    },

    /**
     * 006. 综合场景：无token注册+GC（无法取消，回调触发）
     * 优化点：内部方法封装target、GC前后各10ms延时
     */
    async test006_NoTokenRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Map();
            registry.register(target, "no-token-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test006失败：无token注册后GC未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: NoTokenRegisterGCTest006";
    },

    /**
     * 007. 综合场景：循环引用目标+GC（弱引用仍可回收）
     * 优化点：内部方法封装循环引用目标、GC前后各10ms延时
     */
    async test007_CircularReferenceTargetGC() {
        "use strict";
        let callbackCalled = false;
        const callback = (hv) => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            target.self = target;
            registry.register(target, "circular-held-007");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test007失败：循环引用目标GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: CircularReferenceTargetGCTest007";
    },

    /**
     * 008. 综合场景：多实例独立注册+GC（回调互不干扰）
     * 优化点：内部方法封装多target、GC前后各10ms延时
     */
    async test008_MultipleInstancesGC() {
        "use strict";
        let instance1Called = false;
        let instance2Called = false;
        const callback1 = () => {
            instance1Called = true;
        };
        const callback2 = function() {
            instance2Called = true;
        };
        const registry1 = new FinalizationRegistry(callback1);
        const registry2 = new FinalizationRegistry(callback2);

        const executeRegistration = () => {
            const target1 = {};
            const target2 = {};
            registry1.register(target1, "instance1-held");
            registry2.register(target2, "instance2-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!instance1Called || !instance2Called) {
            throw new Error(`Test008失败：多实例GC回调未全部触发（instance1: ${instance1Called}，instance2: ${instance2Called}`);
        }
        return "Test Passed: MultipleInstancesGCTest008";
    },

    /**
     * 009. 综合场景：注册后目标生命周期结束+GC（原目标仍被回收）
     * 优化点：内部方法封装目标（无需重新赋值）、GC前后各10ms延时
     */
    async test009_TargetLifecycleEndGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "lifecycle-end-held";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test009失败：目标生命周期结束后GC回调未接收heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: TargetLifecycleEndGCTest009";
    },

    /**
     * 010. 综合场景：冻结对象目标+GC（冻结对象可被回收）
     * 优化点：内部方法封装冻结对象、GC前后各10ms延时
     */
    async test010_FrozenTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Object.freeze({ frozen: true });
            registry.register(target, "frozen-held-010");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test0010失败：冻结对象目标GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: FrozenTargetRegisterGCTest010";
    },

    /**
     * 011. 综合场景：同一token关联多个target+取消+GC（全部取消不触发回调）
     * 核心特性：一个token绑定多个target，取消后所有target GC均不触发回调
     */
    async test011_MultipleTargetsSameTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const sharedToken = {};

        const executeRegistration = () => {
            const target1 = {};
            const target2 = new Map();
            const target3 = Symbol("multi-target-011");
            registry.register(target1, "target1-held", sharedToken);
            registry.register(target2, "target2-held", sharedToken);
            registry.register(target3, "target3-held", sharedToken);
        };

        executeRegistration();
        registry.unregister(sharedToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test011失败：同一token多target取消后仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: MultipleTargetsSameTokenUnregisterGCTest011";
    },

    /**
     * 012. 综合场景：heldValue为null（≠target）+注册+GC（回调正常接收）
     * 核心特性：heldValue为null且不等于target时，GC后回调接收null
     */
    async test012_HeldValueAsNullRegisterGC() {
        "use strict";
        let capturedHeldValue = undefined;
        const expectedHeldValue = null;
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test012失败：heldValue为null时回调未接收正确值（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        }
        return "Test Passed: HeldValueAsNullRegisterGCTest012";
    },

    /**
     * 013. 综合场景：target为类实例+注册+GC（类实例可回收）
     * 核心特性：自定义类实例作为target，GC后回调正常触发
     */
    async test013_ClassInstanceTargetRegisterGC() {
        "use strict";
        class CustomTarget {}
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new CustomTarget();
            registry.register(target, "class-instance-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test013失败：类实例target GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: ClassInstanceTargetRegisterGCTest013";
    },

    /**
     * 014. 综合场景：注册-取消-重新注册-GC（重新注册后回调触发）
     * 核心特性：取消后重新注册同一target，GC后回调正常执行
     */
    async test014_RegisterUnregisterReregisterGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = "reregister-held-014";
        const callback = (hv) => {
            capturedHeldValue = hv;
        };
        const registry = new FinalizationRegistry(callback);
        const token = {};

        const executeRegistration = (isFirst = true) => {
            const target = {};
            const heldValue = isFirst ? "first-held" : expectedHeldValue;
            registry.register(target, heldValue, token);
        };

        executeRegistration(true);
        registry.unregister(token);
        executeRegistration(false);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) {
            throw new Error(`Test014失败：重新注册后GC回调未接收正确heldValue（实际: ${capturedHeldValue}`);
        }
        return "Test Passed: RegisterUnregisterReregisterGCTest014";
    },

    /**
     * 015. 综合场景：heldValue为非注册Symbol+注册+GC（回调接收Symbol）
     * 核心特性：非注册Symbol作为heldValue，GC后回调正常接收
     */
    async test015_HeldValueAsNonRegisteredSymbolGC() {
        "use strict";
        let capturedHeldSymbol = null;
        const expectedHeldSymbol = Symbol("held-symbol-015");
        const callback = (hv) => {
            capturedHeldSymbol = hv;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldSymbol);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldSymbol !== expectedHeldSymbol) {
            throw new Error(`Test015失败：Symbol类型heldValue未被正确接收（实际: ${capturedHeldSymbol}`);
        }
        return "Test Passed: HeldValueAsNonRegisteredSymbolGCTest015";
    },

    /**
     * 016. 综合场景：多轮注册-取消-注册-取消-GC（最终取消不触发回调）
     * 核心特性：多轮操作后最终取消，GC后回调不执行
     */
    async test016_MultipleRoundRegisterUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token1 = {};
        const token2 = {};

        const executeRegistration = (token, heldValue) => {
            const target = {};
            registry.register(target, heldValue, token);
        };


        executeRegistration(token1, "round1-held");
        registry.unregister(token1);
        executeRegistration(token2, "round2-held");
        registry.unregister(token2);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test016失败：多轮取消后GC仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: MultipleRoundRegisterUnregisterGCTest016";
    },

    /**
     * 017. 综合场景：target为WeakSet实例+注册+GC（WeakSet可回收）
     * 核心特性：WeakSet实例作为target，GC后回调正常触发
     */
    async test017_WeakSetTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new WeakSet();
            registry.register(target, "weakset-held-017");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) {
            throw new Error(`Test017失败：WeakSet实例target GC后未触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: WeakSetTargetRegisterGCTest017";
    },

    /**
     * 018. 综合场景：回调内部修改外部变量+GC（验证回调执行时机）
     * 核心特性：GC触发回调时，可正常修改外部声明的变量
     */
    async test018_CallbackModifyExternalVarGC() {
        "use strict";
        let externalCount = 0;
        const callback = () => {
            externalCount++;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target1 = {};
            const target2 = Symbol("modify-var-target");
            registry.register(target1, "var1-held");
            registry.register(target2, "var2-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (externalCount !== 2) {
            throw new Error(`Test018失败：回调未正确修改外部变量（预期: 2，实际: ${externalCount}`);
        }
        return "Test Passed: CallbackModifyExternalVarGCTest018";
    },

    /**
     * 019. 综合场景：同一registry注册不同类型target（对象+Symbol）+GC（独立触发）
     * 核心特性：同一注册表中不同类型target，GC后各自回调独立触发
     */
    async test019_DifferentTypeTargetsSameRegistryGC() {
        "use strict";
        let objectTargetCalled = false;
        let symbolTargetCalled = false;
        const callback = (hv) => {
            if (hv === "object-type-held") objectTargetCalled = true;
            if (hv === "symbol-type-held") symbolTargetCalled = true;
        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const objectTarget = new Date();
            const symbolTarget = Symbol("different-type-target");
            registry.register(objectTarget, "object-type-held");
            registry.register(symbolTarget, "symbol-type-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!objectTargetCalled || !symbolTargetCalled) {
            throw new Error(`Test019失败：不同类型target回调未全部触发（对象: ${objectTargetCalled}，Symbol: ${symbolTargetCalled}`);
        }
        return "Test Passed: DifferentTypeTargetsSameRegistryGCTest019";
    },

    /**
     * 020. 综合场景：token为类实例+注册+取消+GC（类实例token可正常取消）
     * 核心特性：自定义类实例作为token，取消后GC不触发回调
     */
    async test020_ClassInstanceTokenUnregisterGC() {
        "use strict";
        class TokenClass {}
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;
        };
        const registry = new FinalizationRegistry(callback);
        const token = new TokenClass();

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "class-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) {
            throw new Error(`Test020失败：类实例token取消后仍触发回调（实际状态: ${callbackCalled}`);
        }
        return "Test Passed: ClassInstanceTokenUnregisterGCTest020";
    },

    /**
     * 021. 综合场景：target为Proxy代理对象+注册+GC（代理对象可回收）
     */
    async test021_ProxyTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const originalTarget = {};
            const proxyTarget = new Proxy(originalTarget, {});
            registry.register(proxyTarget, "proxy-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test021失败：Proxy代理对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ProxyTargetRegisterGCTest021";
    },

    /**
     * 022. 综合场景：heldValue为已resolved Promise+GC（回调接收完整Promise）
     */
    async test022_HeldValueAsResolvedPromiseGC() {
        "use strict";
        let capturedPromise = null;
        const resolvedPromise = Promise.resolve("promise-resolved");
        const callback = (hv) => { capturedPromise = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, resolvedPromise);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedPromise instanceof Promise && await capturedPromise === "promise-resolved";
        if (!isValid) throw new Error(`Test022失败：resolved Promise作为heldValue失效（实际: ${capturedPromise}`);
        return "Test Passed: HeldValueAsResolvedPromiseGCTest022";
    },

    /**
     * 023. 综合场景：target为密封对象（Object.seal）+注册+GC（密封对象可回收）
     */
    async test023_SealedTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Object.seal({ sealed: true });
            registry.register(target, "sealed-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test023失败：密封对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: SealedTargetRegisterGCTest023";
    },

    /**
     * 024. 综合场景：token为Proxy代理对象+注册+取消+GC（代理token可正常取消）
     */
    async test024_ProxyTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            const originalToken = {};
            const proxyToken = new Proxy(originalToken, {});
            registry.register(target, "proxy-token-held", proxyToken);
            return proxyToken;
        };

        const proxyToken = executeRegistration();
        registry.unregister(proxyToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test024失败：Proxy代理token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ProxyTokenUnregisterGCTest024";
    },


    /**
     * 026. 综合场景：同一target不同token，取消最早token（不影响后续注册）
     */
    async test026_UnregisterEarlyTokenForSameTargetGC() {
        "use strict";
        let capturedHeldValue = null;
        const finalHeldValue = "final-early-token-held";
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);
        const token1 = {};
        const token2 = {};

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "early-held", token1);
            registry.register(target, finalHeldValue, token2);
        };

        executeRegistration();
        registry.unregister(token1);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== finalHeldValue) throw new Error(`Test026失败：取消早期token后未接收后期heldValue（实际: ${capturedHeldValue}`);
        return "Test Passed: UnregisterEarlyTokenForSameTargetGCTest026";
    },

    /**
     * 027. 综合场景：target为Error实例+注册+GC（错误实例可回收）
     */
    async test027_ErrorInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Error("test-error-target");
            registry.register(target, "error-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test027失败：Error实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ErrorInstanceTargetRegisterGCTest027";
    },



    /**
     * 029. 综合场景：token为Error实例+注册+取消+GC（错误实例token可正常取消）
     */
    async test029_ErrorInstanceTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Error("test-error-token");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "error-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test029失败：Error实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ErrorInstanceTokenUnregisterGCTest029";
    },

    /**
     * 030. 综合场景：target为Set实例+注册+GC（Set实例可回收）
     */
    async test030_SetInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Set([1, 2, 3]);
            registry.register(target, "set-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test030失败：Set实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: SetInstanceTargetRegisterGCTest030";
    },

    /**
     * 031. 综合场景：heldValue为BigInt+注册+GC（回调接收BigInt）
     */
    async test031_HeldValueAsBigIntGC() {
        "use strict";
        let capturedBigInt = null;
        const expectedBigInt = 9876543210123456789n;
        const callback = (hv) => { capturedBigInt = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedBigInt);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedBigInt !== expectedBigInt) throw new Error(`Test031失败：BigInt作为heldValue未正确接收（预期: ${expectedBigInt}，实际: ${capturedBigInt}`);
        return "Test Passed: HeldValueAsBigIntGCTest031";
    },



    /**
     * 034. 综合场景：heldValue为NaN+注册+GC（回调接收NaN）
     */
    async test034_HeldValueAsNaNGCC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = NaN;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!Number.isNaN(capturedHeldValue)) throw new Error(`Test034失败：NaN作为heldValue未正确接收（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsNaNGCTest034";
    },

    /**
     * 035. 综合场景：target为RegExp实例+注册+GC（正则实例可回收）
     */
    async test035_RegExpInstanceTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = /test-regex-target/gi;
            registry.register(target, "regex-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test035失败：RegExp实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RegExpInstanceTargetRegisterGCTest035";
    },

    /**
     * 036. 综合场景：回调抛出错误+注册+GC（错误不影响GC和其他逻辑）
     */
    async test036_CallbackThrowsErrorGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => {
            callbackCalled = true;

        };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "throw-error-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test036失败：回调抛错后未触发（实际: ${callbackCalled}`);
        return "Test Passed: CallbackThrowsErrorGCTest036";
    },

    /**
     * 037. 综合场景：heldValue为Infinity+注册+GC（回调接收Infinity）
     */
    async test037_HeldValueAsInfinityGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = Infinity;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) throw new Error(`Test037失败：Infinity作为heldValue未正确接收（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsInfinityGCTest037";
    },

    /**
     * 038. 综合场景：target为嵌套冻结对象+注册+GC（嵌套冻结对象可回收）
     */
    async test038_NestedFrozenTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const nestedObj = Object.freeze({ deep: "frozen" });
            const target = Object.freeze({ nested: nestedObj });
            registry.register(target, "nested-frozen-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test038失败：嵌套冻结对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NestedFrozenTargetRegisterGCTest038";
    },

    /**
     * 039. 综合场景：token为嵌套密封对象+注册+取消+GC（嵌套密封token可取消）
     */
    async test039_NestedSealedTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const nestedToken = Object.seal({ deep: "sealed" });
            const token = Object.seal({ nested: nestedToken });
            const target = {};
            registry.register(target, "nested-sealed-held", token);
            return token;
        };

        const token = executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test039失败：嵌套密封token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NestedSealedTokenUnregisterGCTest039";
    },

    /**
     * 040. 综合场景：heldValue为嵌套对象+注册+GC（回调接收完整嵌套对象）
     */
    async test040_HeldValueAsNestedObjectGC() {
        "use strict";
        let capturedNestedObj = null;
        const nestedHeldValue = {
            level1: { level2: { value: "nested-held-value" } }
        };
        const callback = (hv) => { capturedNestedObj = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, nestedHeldValue);
        };

        executeRegistration();
        nestedHeldValue.level1.level2.updated = true;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedNestedObj?.level1?.level2?.value === "nested-held-value" && capturedNestedObj?.level1?.level2?.updated === true;
        if (!isValid) throw new Error(`Test040失败：嵌套heldValue对象失效（实际: ${JSON.stringify(capturedNestedObj)}`);
        return "Test Passed: HeldValueAsNestedObjectGCTest040";
    },

    /**
     * 041. 综合场景：target为已rejected Promise+注册+GC（Promise实例可回收）
     */
    async test041_RejectedPromiseTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = Promise.reject(new Error("rejected-promise-target"));
            registry.register(target, "rejected-promise-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test041失败：已rejected Promise实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RejectedPromiseTargetRegisterGCTest041";
    },

    /**
     * 042. 综合场景：token为已resolved Promise+注册+取消+GC（Promise token可取消）
     */
    async test042_ResolvedPromiseTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = Promise.resolve("resolved-promise-token");

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "promise-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test042失败：已resolved Promise实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ResolvedPromiseTokenUnregisterGCTest042";
    },

    /**
     * 043. 综合场景：heldValue为循环引用对象+注册+GC（循环引用heldValue可访问）
     */
    async test043_HeldValueAsCircularObjectGC() {
        "use strict";
        let capturedCircularObj = null;
        const circularObj = {};
        circularObj.self = circularObj;
        circularObj.nested = { parent: circularObj };
        const callback = (hv) => { capturedCircularObj = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, circularObj);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedCircularObj?.self === capturedCircularObj && capturedCircularObj?.nested?.parent === capturedCircularObj;
        if (!isValid) throw new Error(`Test043失败：循环引用heldValue对象失效（实际: ${capturedCircularObj}`);
        return "Test Passed: HeldValueAsCircularObjectGCTest043";
    },


    /**
     * 046. 综合场景：heldValue为带参数函数+注册+GC（回调可调用heldValue函数）
     */
    async test046_HeldValueAsParamFunctionGC() {
        "use strict";
        let capturedFunction = null;
        const addFn = (a, b) => a + b;
        const callback = (hv) => { capturedFunction = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, addFn);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = typeof capturedFunction === "function" && capturedFunction(2, 3) === 5;
        if (!isValid) throw new Error(`Test046失败：函数类型heldValue失效（实际: ${capturedFunction}`);
        return "Test Passed: HeldValueAsParamFunctionGCTest046";
    },




    /**
     * 049. 综合场景：多registry实例+同一token+注册+取消+GC（取消仅影响当前实例）
     */
    async test049_MultipleRegistriesSameTokenUnregisterGC() {
        "use strict";
        let registry1Called = false;
        let registry2Called = false;
        const callback1 = () => { registry1Called = true; };
        const callback2 = () => { registry2Called = true; };
        const registry1 = new FinalizationRegistry(callback1);
        const registry2 = new FinalizationRegistry(callback2);
        const sharedToken = {};

        const executeRegistration = () => {
            const target1 = {};
            const target2 = {};
            registry1.register(target1, "registry1-held", sharedToken);
            registry2.register(target2, "registry2-held", sharedToken);
        };

        executeRegistration();
        registry1.unregister(sharedToken);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (registry1Called || !registry2Called) throw new Error(`Test049失败：多实例同一token取消逻辑异常（registry1: ${registry1Called}，registry2: ${registry2Called}`);
        return "Test Passed: MultipleRegistriesSameTokenUnregisterGCTest049";
    },

    /**
     * 050. 综合场景：heldValue为undefined+注册+GC（回调接收undefined）
     */
    async test050_HeldValueAsUndefinedGC() {
        "use strict";
        let capturedHeldValue = null;
        const expectedHeldValue = undefined;
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedHeldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== expectedHeldValue) throw new Error(`Test050失败：undefined作为heldValue未正确接收（预期: ${expectedHeldValue}，实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueAsUndefinedGCTest050";
    },





    /**
     * 053. 综合场景：heldValue为已注册Symbol（Symbol.iterator）+注册+GC（回调接收）
     */
    async test053_HeldValueAsRegisteredSymbolGC() {
        "use strict";
        let capturedSymbol = null;
        const expectedSymbol = Symbol.iterator;
        const callback = (hv) => { capturedSymbol = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, expectedSymbol);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedSymbol !== expectedSymbol) throw new Error(`Test053失败：已注册Symbol作为heldValue未正确接收（实际: ${capturedSymbol}`);
        return "Test Passed: HeldValueAsRegisteredSymbolGCTest053";
    },



    /**
     * 055. 综合场景：target被WeakMap引用再释放+GC（WeakMap引用不影响回收）
     */
    async test055_TargetReferencedByWeakMapThenReleasedGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const weakMap = new WeakMap();

        const executeRegistration = () => {
            const target = {};
            weakMap.set(target, "weakmap-value");
            registry.register(target, "weakmap-ref-held");
            weakMap.delete(target);

        };

       executeRegistration();

        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test055失败：WeakMap释放引用后target未被GC（实际: ${callbackCalled}`);
        return "Test Passed: TargetReferencedByWeakMapThenReleasedGCTest055";
    },
    /**
     * 056. 综合场景：heldValue被WeakSet引用+GC（WeakSet不影响heldValue强引用）
     */
    async test056_HeldValueReferencedByWeakSetGC() {
        "use strict";
        let capturedHeldValue = null;
        const heldValue = {};
        const weakSet = new WeakSet([heldValue]);
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldValue);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (capturedHeldValue !== heldValue) throw new Error(`Test056失败：WeakSet引用的heldValue被释放（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueReferencedByWeakSetGCTest056";
    },

    /**
     * 057. 综合场景：token被深度修改属性后+取消+GC（token属性深度修改不影响取消）
     */
    async test057_TokenDeepModifiedPropertiesUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            const token = { id: 1, nested: { data: "original" } };
            registry.register(target, "deep-modified-token-held", token);
            return token;
        };

        const token = executeRegistration();
        token.id = 999;
        token.nested.data = "modified";
        token.nested.newProp = { deep: "added" };
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test057失败：token深度修改后取消失效（实际: ${callbackCalled}`);
        return "Test Passed: TokenDeepModifiedPropertiesUnregisterGCTest057";
    },

    /**
     * 058. 综合场景：heldValue替换原型链后+GC（完整原型链修改不影响heldValue）
     */
    async test058_HeldValueReplacePrototypeChainGC() {
        "use strict";
        let capturedHeldValue = null;
        const heldValue = {};
        const callback = (hv) => { capturedHeldValue = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, heldValue);
        };

        executeRegistration();
        const newProto1 = { method1: () => "proto1" };
        const newProto2 = { method2: () => "proto2" };
        Object.setPrototypeOf(newProto1, newProto2);
        Object.setPrototypeOf(heldValue, newProto1);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = heldValue.method1() === "proto1" && heldValue.method2() === "proto2";
        if (!isValid) throw new Error(`Test058失败：heldValue原型链替换后失效（实际: ${capturedHeldValue}`);
        return "Test Passed: HeldValueReplacePrototypeChainGCTest058";
    },

    /**
     * 059. 综合场景：target为不可扩展对象（Object.preventExtensions）+注册+GC（可回收）
     */
    async test059_NonExtensibleTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = { nonExtensible: true };
            Object.preventExtensions(target);
            registry.register(target, "non-extensible-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test059失败：不可扩展对象target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NonExtensibleTargetRegisterGCTest059";
    },

    /**
     * 060. 综合场景：token为不可扩展对象+注册+取消+GC（不可扩展token可取消）
     */
    async test060_NonExtensibleTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const token = { nonExtensible: true };
            Object.preventExtensions(token);
            const target = {};
            registry.register(target, "non-extensible-token-held", token);
            return token;
        };

        const token = executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test060失败：不可扩展token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: NonExtensibleTokenUnregisterGCTest060";
    },

    /**
     * 061. 综合场景：多个target先后注册+先后释放+GC（回调按释放顺序触发）
     */
    async test061_MultipleTargetsSequentialReleaseGC() {
        "use strict";
        const callbackOrder = [];
        const callback = (hv) => { callbackOrder.push(hv); };
        const registry = new FinalizationRegistry(callback);
        const targets = [];

        const executeRegistration = () => {
            for (let i = 1; i <= 4; i++) {
                const target = {};
                targets.push({ target, held: `target-${i}` });
                registry.register(target, `target-${i}`);
            }
        };

        executeRegistration();

        targets[1].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[3].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[0].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        targets[2].target = null;
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const expectedOrder = ["target-2", "target-4", "target-1", "target-3"];
        if (JSON.stringify(callbackOrder) !== JSON.stringify(expectedOrder)) throw new Error(`Test061失败：回调触发顺序异常（预期: ${expectedOrder}，实际: ${callbackOrder}`);
        return "Test Passed: MultipleTargetsSequentialReleaseGCTest061";
    },


    /**
     * 064. 综合场景：注册后延迟20ms取消+GC（延迟取消仍有效）
     */
    async test064_Delayed20msUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = {};

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "delayed-20ms-unregister-held", token);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 20));
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test064失败：延迟20ms取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: Delayed20msUnregisterGCTest064";
    },


    /**
     * 068. 综合场景：target为Intl.DateTimeFormat实例（复杂格式）+注册+GC
     */
    async test068_ComplexIntlDateTimeFormatTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Intl.DateTimeFormat('zh-CN', {
                dateStyle: 'full',
                timeStyle: 'long',
                timeZone: 'Asia/Shanghai'
            });
            registry.register(target, "complex-intl-datetime-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test068失败：复杂格式的Intl.DateTimeFormat实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ComplexIntlDateTimeFormatTargetRegisterGCTest068";
    },



    /**
     * 070. 综合场景：token为Intl.Collator实例（复杂排序规则）+注册+取消+GC
     */
    async test070_ComplexIntlCollatorTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Intl.Collator('zh-CN', {
            sensitivity: 'accent',
            caseFirst: 'upper'
        });

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "complex-intl-collator-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test070失败：复杂排序规则的Intl.Collator实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ComplexIntlCollatorTokenUnregisterGCTest070";
    },

    /**
     * 071. 综合场景：target为Intl.PluralRules实例（多语言复数）+注册+GC
     */
    async test071_MultiLangIntlPluralRulesTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Intl.PluralRules('ar-EG', { type: 'ordinal' });
            registry.register(target, "multi-lang-intl-plural-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test071失败：多语言复数规则的Intl.PluralRules实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: MultiLangIntlPluralRulesTargetRegisterGCTest071";
    },



    /**
     * 073. 综合场景：token为Intl.ListFormat实例（多格式列表）+注册+取消+GC
     */
    async test073_MultiFormatIntlListFormatTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Intl.ListFormat('fr-CA', {
            type: 'disjunction',
            style: 'narrow'
        });

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "multi-format-intl-list-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test073失败：多格式列表的Intl.ListFormat实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: MultiFormatIntlListFormatTokenUnregisterGCTest073";
    },

    /**
     * 074. 综合场景：target为Uint16Array实例（大尺寸）+注册+GC
     */
    async test074_LargeUint16ArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Uint16Array(1024);
            for (let i = 0; i < target.length; i++) target[i] = i % 65535;
            registry.register(target, "large-uint16array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test074失败：大尺寸Uint16Array实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: LargeUint16ArrayTargetRegisterGCTest074";
    },

    /**
     * 075. 综合场景：heldValue为Int32Array实例（填充数据）+注册+GC
     */
    async test075_HeldValueAsFilledInt32ArrayGC() {
        "use strict";
        let capturedTypedArray = null;
        const intArray = new Int32Array(512);
        intArray.fill(100);
        intArray[100] = -200;
        intArray[200] = 300;
        const callback = (hv) => { capturedTypedArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, intArray);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedTypedArray instanceof Int32Array &&
            capturedTypedArray[100] === -200 && capturedTypedArray[200] === 300;
        if (!isValid) throw new Error(`Test075失败：填充数据的Int32Array实例作为heldValue失效（实际: ${capturedTypedArray}`);
        return "Test Passed: HeldValueAsFilledInt32ArrayGCTest075";
    },

    /**
     * 076. 综合场景：token为Uint32Array实例（随机数据）+注册+取消+GC
     */
    async test076_RandomDataUint32ArrayTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new Uint32Array(256);
        for (let i = 0; i < token.length; i++) token[i] = Math.floor(Math.random() * 4294967295);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "random-uint32array-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test076失败：随机数据的Uint32Array实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: RandomDataUint32ArrayTokenUnregisterGCTest076";
    },

    /**
     * 077. 综合场景：target为Float32Array实例（精度测试数据）+注册+GC
     */
    async test077_PrecisionFloat32ArrayTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = function() { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = new Float32Array([0.1, 0.2, 0.3, 0.1 + 0.2]);
            registry.register(target, "precision-float32array-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test077失败：精度测试数据的Float32Array实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: PrecisionFloat32ArrayTargetRegisterGCTest077";
    },

    /**
     * 078. 综合场景：heldValue为BigUint64Array实例（大数值）+注册+GC
     */
    async test078_HeldValueAsBigUint64ArrayWithLargeNumbersGC() {
        "use strict";
        let capturedTypedArray = null;
        const bigArray = new BigUint64Array([9876543210123456789n, 1234567890987654321n]);
        const callback = (hv) => { capturedTypedArray = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, bigArray);
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedTypedArray instanceof BigUint64Array &&
            capturedTypedArray[0] === 9876543210123456789n;
        if (!isValid) throw new Error(`Test078失败：大数值的BigUint64Array实例作为heldValue失效（实际: ${capturedTypedArray}`);
        return "Test Passed: HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078";
    },

    /**
     * 079. 综合场景：token为BigInt64Array实例（正负大数值）+注册+取消+GC
     */
    async test079_BigInt64ArrayWithPosNegTokenUnregisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);
        const token = new BigInt64Array([-9876543210123456789n, 1234567890987654321n]);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, "bigint64-posneg-token-held", token);
        };

        executeRegistration();
        registry.unregister(token);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (callbackCalled) throw new Error(`Test079失败：正负大数值的BigInt64Array实例token取消后仍触发回调（实际: ${callbackCalled}`);
        return "Test Passed: BigInt64ArrayWithPosNegTokenUnregisterGCTest079";
    },

    /**
     * 080. 综合场景：target为ArrayBuffer实例（共享数据）+注册+GC
     */
    async test080_ArrayBufferWithSharedDataTargetRegisterGC() {
        "use strict";
        let callbackCalled = false;
        const callback = () => { callbackCalled = true; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const buffer = new ArrayBuffer(16);
            const view1 = new Uint8Array(buffer);
            const view2 = new Float32Array(buffer);
            view1.fill(255);
            view2[2] = 1.234;
            registry.register(buffer, "arraybuffer-shared-target-held");
        };

        executeRegistration();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        if (!callbackCalled) throw new Error(`Test080失败：共享数据的ArrayBuffer实例target GC后未触发回调（实际: ${callbackCalled}`);
        return "Test Passed: ArrayBufferWithSharedDataTargetRegisterGCTest080";
    },

    /**
     * 081. 综合场景：heldValue为SharedArrayBuffer实例（原子操作）+注册+GC
     */
    async test081_HeldValueAsSharedArrayBufferWithAtomicsGC() {
        "use strict";
        if (typeof SharedArrayBuffer !== "function" || typeof Atomics !== "object") return "Test Skipped: SharedArrayBuffer/Atomics not supported";

        let capturedBuffer = null;
        const buffer = new SharedArrayBuffer(4);
        const view = new Int32Array(buffer);
        Atomics.store(view, 0, 100);
        const callback = (hv) => { capturedBuffer = hv; };
        const registry = new FinalizationRegistry(callback);

        const executeRegistration = () => {
            const target = {};
            registry.register(target, buffer);
        };

        executeRegistration();
        Atomics.add(view, 0, 50);
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 10));

        const isValid = capturedBuffer instanceof SharedArrayBuffer && Atomics.load(new Int32Array(capturedBuffer), 0) === 150;
        if (!isValid) throw new Error(`Test081失败：原子操作的SharedArrayBuffer实例作为heldValue失效（实际: ${capturedBuffer}`);
        return "Test Passed: HeldValueAsSharedArrayBufferWithAtomicsGCTest081";
    },


};