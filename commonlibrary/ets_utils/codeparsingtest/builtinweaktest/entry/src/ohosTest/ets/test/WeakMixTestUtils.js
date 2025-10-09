export const WeakMixTestUtils = {
    /**
     * 000. 基础组合：WeakSet存储对象，WeakMap映射到它们的WeakRef
     */
    async test007_WeakSetMapRefBasic() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let obj1, obj2, ref1, ref2;

        // 创建对象并建立引用关系
        (function createObjects() {
            obj1 = { id: 'obj-1-000' };
            obj2 = { id: 'obj-2-000' };

            // WeakSet存储对象
            weakSet.add(obj1);
            weakSet.add(obj2);

            // WeakMap映射到对象的WeakRef
            ref1 = new WeakRef(obj1);
            ref2 = new WeakRef(obj2);
            weakMap.set(obj1, ref2);
            weakMap.set(obj2, ref1);

            // 验证初始状态
            if (!weakSet.has(obj1) || !weakSet.has(obj2)) throw new Error("WeakSet initialization failed");
            if (weakMap.get(obj1)?.deref() !== obj2 || weakMap.get(obj2)?.deref() !== obj1) {
                throw new Error("WeakMap WeakRef mapping failed");
            }
        })();

        // 清除强引用
        const tempRef1 = ref1;
        const tempRef2 = ref2;
        obj1 = null;
        obj2 = null;
        ref1 = null;
        ref2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRef1.deref() !== undefined || tempRef2.deref() !== undefined) {
            throw new Error("Objects not properly GC'd");
        }

        return "Test Passed: WeakSetMapRefBasicTest007";
    },

    /**
     * 001. 数组元素组合：WeakMap使用数组作为键，WeakSet存储元素
     */
    async test001_WeakMixArrayElements() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let mainArray, element1, element2, arrayRef;

        (function createArrayStructure() {
            element1 = { id: 'elem-1-001' };
            element2 = { id: 'elem-2-001' };
            mainArray = [element1, element2];

            // WeakSet存储数组元素
            weakSet.add(element1);
            weakSet.add(element2);

            // WeakMap使用数组作为键，存储元素的WeakRef
            const elementsRef = new WeakRef([
                new WeakRef(element1),
                new WeakRef(element2)
            ]);
            weakMap.set(mainArray, elementsRef);

            arrayRef = new WeakRef(mainArray);

            // 验证初始状态
            if (!weakSet.has(element1) || !weakSet.has(element2)) throw new Error("WeakSet elements missing");
            if (!weakMap.has(mainArray)) throw new Error("WeakMap array key missing");
        })();

        // 清除强引用
        const tempArrayRef = arrayRef;
        const tempElement1Ref = new WeakRef(element1);
        const tempElement2Ref = new WeakRef(element2);
        mainArray = null;
        element1 = null;
        element2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayRef.deref() !== undefined) throw new Error("Array not GC'd");
        if (tempElement1Ref.deref() !== undefined || tempElement2Ref.deref() !== undefined) {
            throw new Error("Array elements not GC'd");
        }

        return "Test Passed: WeakMixArrayElementsTest001";
    },

    /**
     * 002. Map条目组合：WeakSet存储Maps，WeakMap关联到条目数组的WeakRef
     */
    async test002_WeakMixMapEntries() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let mainMap, keyObj, valueObj, mapRef;

        (function createMapStructure() {
            keyObj = { id: 'key-002' };
            valueObj = { id: 'value-002' };
            mainMap = new Map([[keyObj, valueObj]]);

            // WeakSet存储Map实例
            weakSet.add(mainMap);

            // 创建条目数组并存储其WeakRef
            const entries = Array.from(mainMap.entries());
            const entriesRef = new WeakRef(entries);
            weakMap.set(mainMap, entriesRef);

            mapRef = new WeakRef(mainMap);

            // 验证初始状态
            if (!weakSet.has(mainMap)) throw new Error("WeakSet does not contain map");
            if (weakMap.get(mainMap)?.deref() !== entries) throw new Error("Entries WeakRef mismatch");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempKeyRef = new WeakRef(keyObj);
        const tempValueRef = new WeakRef(valueObj);
        mainMap = null;
        keyObj = null;
        valueObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Map instance not GC'd");
        if (tempKeyRef.deref() !== undefined || tempValueRef.deref() !== undefined) {
            throw new Error("Map entries not GC'd");
        }

        return "Test Passed: WeakMixMapEntriesTest002";
    },

    /**
     * 003. 日期跟踪组合：WeakSet存储Date，WeakMap关联相关数据的WeakRef
     */
    async test003_WeakMixDateTracking() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let dateObj, relatedData, dateRef;

        (function createDateStructure() {
            dateObj = new Date('2024-01-01');
            relatedData = {
                id: 'data-003',
                formatted: dateObj.toISOString(),
                source: dateObj
            };

            // WeakSet存储Date对象
            weakSet.add(dateObj);

            // WeakMap关联到相关数据的WeakRef
            const dataRef = new WeakRef(relatedData);
            weakMap.set(dateObj, dataRef);

            dateRef = new WeakRef(dateObj);

            // 验证初始状态
            if (!weakSet.has(dateObj)) throw new Error("WeakSet does not contain date");
            if (weakMap.get(dateObj)?.deref() !== relatedData) throw new Error("Data WeakRef mismatch");
        })();

        // 清除强引用
        const tempDateRef = dateRef;
        const tempDataRef = new WeakRef(relatedData);
        dateObj = null;
        relatedData = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDateRef.deref() !== undefined) throw new Error("Date object not GC'd");
        if (tempDataRef.deref() !== undefined) throw new Error("Related data not GC'd");

        return "Test Passed: WeakMixDateTrackingTest003";
    },

    /**
     * 004. 正则匹配组合：WeakSet存储RegExp，WeakMap关联匹配结果的WeakRef
     */
    async test004_WeakMixRegExpMatches() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, matchResults, regexRef;

        (function createRegexStructure() {
            regexObj = /user=(\w+)/g;
            const testString = "user=alice;user=bob;user=charlie";

            // 获取匹配结果
            matchResults = [];
            let match;
            while ((match = regexObj.exec(testString)) !== null) {
                matchResults.push([...match]);
            }
            matchResults.sourceRegex = regexObj;

            // WeakSet存储RegExp对象
            weakSet.add(regexObj);

            // WeakMap关联到匹配结果的WeakRef
            const resultsRef = new WeakRef(matchResults);
            weakMap.set(regexObj, resultsRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (!weakSet.has(regexObj)) throw new Error("WeakSet does not contain regex");
            if (weakMap.get(regexObj)?.deref() !== matchResults) throw new Error("Results WeakRef mismatch");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempResultsRef = new WeakRef(matchResults);
        regexObj = null;
        matchResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex object not GC'd");
        if (tempResultsRef.deref() !== undefined) throw new Error("Match results not GC'd");

        return "Test Passed: WeakMixRegExpMatchesTest004";
    },

    /**
     * 005. 缓冲区视图组合：WeakSet存储ArrayBuffer，WeakMap关联DataView的WeakRef
     */
    async test005_WeakMixBufferViews() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let buffer, view, bufferRef;

        (function createBufferStructure() {
            buffer = new ArrayBuffer(32); // 32字节缓冲区
            view = new DataView(buffer);

            // 写入一些测试数据
            view.setUint32(0, 0x12345678);
            view.setFloat64(8, Math.PI);

            // WeakSet存储ArrayBuffer
            weakSet.add(buffer);

            // WeakMap关联到DataView的WeakRef
            const viewRef = new WeakRef(view);
            weakMap.set(buffer, viewRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (!weakSet.has(buffer)) throw new Error("WeakSet does not contain buffer");
            if (weakMap.get(buffer)?.deref() !== view) throw new Error("DataView WeakRef mismatch");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempViewRef = new WeakRef(view);
        buffer = null;
        view = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("ArrayBuffer not GC'd");
        if (tempViewRef.deref() !== undefined) throw new Error("DataView not GC'd");

        return "Test Passed: WeakMixBufferViewsTest005";
    },

    /**
     * 006. 集合操作组合：WeakMap使用Set作为键，WeakSet跟踪相关对象
     */
    async test006_WeakMixSetOperations() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let mainSet, relatedObj1, relatedObj2, setRef;

        (function createSetStructure() {
            relatedObj1 = { id: 'related-1-006', type: 'data' };
            relatedObj2 = { id: 'related-2-006', type: 'meta' };
            mainSet = new Set([1, 2, 3, 4, 5]);

            // WeakSet存储相关对象
            weakSet.add(relatedObj1);
            weakSet.add(relatedObj2);

            // WeakMap使用Set作为键，存储相关对象的WeakRef
            const relatedRefs = new WeakRef({
                data: new WeakRef(relatedObj1),
                meta: new WeakRef(relatedObj2)
            });
            weakMap.set(mainSet, relatedRefs);

            setRef = new WeakRef(mainSet);

            // 验证初始状态
            if (!weakSet.has(relatedObj1) || !weakSet.has(relatedObj2)) {
                throw new Error("WeakSet missing related objects");
            }
            if (!weakMap.has(mainSet)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempObj1Ref = new WeakRef(relatedObj1);
        const tempObj2Ref = new WeakRef(relatedObj2);
        mainSet = null;
        relatedObj1 = null;
        relatedObj2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Set instance not GC'd");
        if (tempObj1Ref.deref() !== undefined || tempObj2Ref.deref() !== undefined) {
            throw new Error("Related objects not GC'd");
        }

        return "Test Passed: WeakMixSetOperationsTest006";
    },



    /**
     * 008. 类实例组合：WeakSet存储类实例，WeakMap关联内部数据的WeakRef
     */
    async test008_WeakMixClassInstances() {
        // 定义测试类
        class DataProcessor {
            constructor(id) {
                this.id = id;
                this.internalData = {
                    cache: new Map(),
                    stats: { hits: 0, misses: 0 }
                };
            }

            process(data) {
                this.internalData.stats.hits++;
                return data.toString();
            }
        }

        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let processor, dataRef;

        (function createClassStructure() {
            processor = new DataProcessor('processor-008');

            // WeakSet存储类实例
            weakSet.add(processor);

            // WeakMap关联到内部数据的WeakRef
            dataRef = new WeakRef(processor.internalData);
            weakMap.set(processor, dataRef);

            // 验证初始状态
            if (!weakSet.has(processor)) throw new Error("WeakSet does not contain instance");
            if (weakMap.get(processor)?.deref() !== processor.internalData) {
                throw new Error("Internal data WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempProcessorRef = new WeakRef(processor);
        const tempDataRef = dataRef;
        processor = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempProcessorRef.deref() !== undefined) throw new Error("Class instance not GC'd");
        if (tempDataRef.deref() !== undefined) throw new Error("Internal data not GC'd");

        return "Test Passed: WeakMixClassInstancesTest008";
    },

    /**
     * 009. 循环引用组合：处理循环引用场景
     */
    async test009_WeakMixCircularRef() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let objA, objB, refA, refB;

        (function createCircularStructure() {
            // 创建循环引用
            objA = { id: 'obj-A-009' };
            objB = { id: 'obj-B-009' };
            objA.linked = objB;
            objB.linked = objA;

            // WeakSet存储这两个对象
            weakSet.add(objA);
            weakSet.add(objB);

            // WeakMap存储相互的WeakRef
            refA = new WeakRef(objA);
            refB = new WeakRef(objB);
            weakMap.set(objA, refB);
            weakMap.set(objB, refA);

            // 验证初始状态
            if (!weakSet.has(objA) || !weakSet.has(objB)) throw new Error("WeakSet missing objects");
            if (weakMap.get(objA)?.deref() !== objB || weakMap.get(objB)?.deref() !== objA) {
                throw new Error("Circular WeakRef mapping failed");
            }
        })();

        // 清除强引用（打破循环引用）
        const tempRefA = refA;
        const tempRefB = refB;
        objA.linked = null;
        objB.linked = null;
        objA = null;
        objB = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (window?.gc || global.gc) (window.gc || global.gc)();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRefA.deref() !== undefined || tempRefB.deref() !== undefined) {
            throw new Error("Circular referenced objects not GC'd");
        }

        return "Test Passed: WeakMixCircularRefTest009";
    },
    /**
     * 010. 嵌套数组组合：WeakMap存储外层数组，WeakSet跟踪内层数组
     */
    async test010_WeakMixNestedArrays() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let outerArray, innerArray1, innerArray2, outerRef;

        (function createNestedArrays() {
            innerArray1 = [1, 2, 3];
            innerArray2 = [4, 5, 6];
            outerArray = [innerArray1, innerArray2];

            // WeakSet跟踪内层数组
            weakSet.add(innerArray1);
            weakSet.add(innerArray2);

            // WeakMap存储外层数组到内层WeakRef的映射
            const innerRefs = new WeakRef({
                first: new WeakRef(innerArray1),
                second: new WeakRef(innerArray2)
            });
            weakMap.set(outerArray, innerRefs);

            outerRef = new WeakRef(outerArray);

            // 验证初始状态
            if (!weakSet.has(innerArray1) || !weakSet.has(innerArray2)) {
                throw new Error("WeakSet missing inner arrays");
            }
            if (!weakMap.has(outerArray)) throw new Error("WeakMap missing outer array");
        })();

        // 清除强引用
        const tempOuterRef = outerRef;
        const tempInner1Ref = new WeakRef(innerArray1);
        const tempInner2Ref = new WeakRef(innerArray2);
        outerArray = null;
        innerArray1 = null;
        innerArray2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOuterRef.deref() !== undefined) throw new Error("Outer array not GC'd");
        if (tempInner1Ref.deref() !== undefined || tempInner2Ref.deref() !== undefined) {
            throw new Error("Inner arrays not GC'd");
        }

        return "Test Passed: WeakMixNestedArraysTest010";
    },

    /**
     * 011. Map转换组合：WeakSet存储原始Map，WeakMap关联转换后的Map的WeakRef
     */
    async test011_WeakMixMapTransformation() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalMap, transformedMap, originalRef;

        (function createTransformedMap() {
            originalMap = new Map([
                [{ id: 'a' }, 10],
                [{ id: 'b' }, 20]
            ]);

            // 创建值加倍的转换Map
            transformedMap = new Map();
            originalMap.forEach((value, key) => {
                transformedMap.set(key, value * 2);
            });
            transformedMap.source = originalMap;

            // WeakSet存储原始Map
            weakSet.add(originalMap);

            // WeakMap关联转换后Map的WeakRef
            const transformedRef = new WeakRef(transformedMap);
            weakMap.set(originalMap, transformedRef);

            originalRef = new WeakRef(originalMap);

            // 验证初始状态
            if (!weakSet.has(originalMap)) throw new Error("WeakSet missing original map");
            if (weakMap.get(originalMap)?.deref() !== transformedMap) {
                throw new Error("Transformed map WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempTransformedRef = new WeakRef(transformedMap);
        originalMap = null;
        transformedMap = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempTransformedRef.deref() !== undefined) throw new Error("Transformed map not GC'd");

        return "Test Passed: WeakMixMapTransformationTest011";
    },

    /**
     * 012. Set差集组合：WeakMap使用两个Set作为键，WeakSet存储差集结果
     */
    async test012_WeakMixSetDifference() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setA, setB, differenceSet, setARef, setBRef;

        // 创建共享对象引用（修复关键点）
        const sharedObj = { id: 'y' };
        const uniqueObjX = { id: 'x' };
        const uniqueObjZ = { id: 'z' };
        const uniqueObjW = { id: 'w' };

        (function createSetDifference() {
            // 使用相同的对象引用构建集合
            setA = new Set([uniqueObjX, sharedObj, uniqueObjZ]);
            setB = new Set([sharedObj, uniqueObjW]);

            // 计算差集 (A - B)
            differenceSet = new Set();
            setA.forEach(item => {
                if (!setB.has(item)) {
                    differenceSet.add(item);
                }
            });

            // WeakSet存储差集结果
            differenceSet.forEach(item => weakSet.add(item));

            // WeakMap使用Set组合作为键，存储差集的WeakRef
            const key = { setA, setB }; // 复合键对象
            const diffRef = new WeakRef(differenceSet);
            weakMap.set(key, diffRef);

            setARef = new WeakRef(setA);
            setBRef = new WeakRef(setB);

            // 验证初始状态（修复关键点：明确预期差集内容）
            if (differenceSet.size !== 2) {
                throw new Error("Set difference calculation failed - unexpected size");
            }
            if (!differenceSet.has(uniqueObjX) || !differenceSet.has(uniqueObjZ)) {
                throw new Error("Set difference calculation failed - missing elements");
            }
            if (!weakMap.has(key)) {
                throw new Error("WeakMap missing set key");
            }
        })();

        // 清除强引用
        const tempSetARef = setARef;
        const tempSetBRef = setBRef;
        const tempDiffRef = new WeakRef(differenceSet);
        setA = null;
        setB = null;
        differenceSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempDiffRef.deref() !== undefined) {
            throw new Error("Difference set not GC'd");
        }

        return "Test Passed: WeakMixSetDifferenceTest012";
    },

    /**
     * 013. 日期计算组合：WeakSet存储日期对象，WeakMap关联计算结果的WeakRef
     */
    async test013_WeakMixDateCalculations() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let startDate, endDate, calculations, dateRefs;

        (function createDateCalculations() {
            startDate = new Date('2024-01-01');
            endDate = new Date('2024-12-31');

            // 计算日期差和中间点
            const diffMs = endDate.getTime() - startDate.getTime();
            const midDate = new Date(startDate.getTime() + diffMs / 2);

            calculations = {
                days: Math.floor(diffMs / (1000 * 60 * 60 * 24)),
                midpoint: midDate,
                source: { startDate, endDate }
            };

            // WeakSet存储日期对象
            weakSet.add(startDate);
            weakSet.add(endDate);
            weakSet.add(midDate);

            // WeakMap关联计算结果的WeakRef
            const calcRef = new WeakRef(calculations);
            weakMap.set(startDate, calcRef);

            dateRefs = {
                start: new WeakRef(startDate),
                end: new WeakRef(endDate)
            };

            // 验证初始状态
            if (calculations.days !== 365) throw new Error("Date calculation failed");
            if (!weakSet.has(midDate)) throw new Error("WeakSet missing mid date");
        })();

        // 清除强引用
        const tempStartRef = dateRefs.start;
        const tempEndRef = dateRefs.end;
        const tempCalcRef = new WeakRef(calculations);
        startDate = null;
        endDate = null;
        calculations = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempStartRef.deref() !== undefined || tempEndRef.deref() !== undefined) {
            throw new Error("Date objects not GC'd");
        }
        if (tempCalcRef.deref() !== undefined) throw new Error("Calculations not GC'd");

        return "Test Passed: WeakMixDateCalculationsTest013";
    },

    /**
     * 014. 正则替换组合：WeakSet存储RegExp，WeakMap关联替换函数的WeakRef
     */
    async test014_WeakMixRegexReplacement() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, replacementFn, regexRef;

        (function createRegexReplacement() {
            regexObj = /(\d+)/g;

            // 创建带状态的替换函数
            replacementFn = (function() {
                let count = 0;
                return function(match, num) {
                    count++;
                    return (Number(num) * 2).toString();
                };
            })();
            replacementFn.regex = regexObj;

            // WeakSet存储RegExp
            weakSet.add(regexObj);

            // WeakMap关联替换函数的WeakRef
            const fnRef = new WeakRef(replacementFn);
            weakMap.set(regexObj, fnRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (!weakSet.has(regexObj)) throw new Error("WeakSet missing regex");
            if (weakMap.get(regexObj)?.deref() !== replacementFn) {
                throw new Error("Replacement function WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempFnRef = new WeakRef(replacementFn);
        regexObj = null;
        replacementFn = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex not GC'd");
        if (tempFnRef.deref() !== undefined) throw new Error("Replacement function not GC'd");

        return "Test Passed: WeakMixRegexReplacementTest014";
    },

    /**
     * 015. 缓冲区转换组合：WeakMap存储原始缓冲区，WeakSet跟踪视图对象
     */
    async test015_WeakMixBufferConversions() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let buffer, intView, floatView, bufferRef;

        (function createBufferViews() {
            // 使用足够大的缓冲区以避免视图重叠导致的意外行为
            buffer = new ArrayBuffer(32); // 32字节缓冲区

            // 创建不同类型的视图，确保它们不重叠
            intView = new Int32Array(buffer, 0, 4); // 占用前16字节
            floatView = new Float32Array(buffer, 16, 4); // 占用后16字节

            // 为每种视图设置适合其类型的值
            const intValue = 42;
            const floatValue = 42.0;

            intView[0] = intValue;
            floatView[0] = floatValue;

            // WeakSet跟踪视图对象
            weakSet.add(intView);
            weakSet.add(floatView);

            // WeakMap存储缓冲区到视图WeakRef的映射
            const viewsRef = new WeakRef({
                int: new WeakRef(intView),
                float: new WeakRef(floatView)
            });
            weakMap.set(buffer, viewsRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态 - 分别验证每种视图的值
            if (intView[0] !== intValue) {
                throw new Error(`Buffer view synchronization failed: Int32 value mismatch, expected ${intValue}, got ${intView[0]}`);
            }
            if (floatView[0] !== floatValue) {
                throw new Error(`Buffer view synchronization failed: Float32 value mismatch, expected ${floatValue}, got ${floatView[0]}`);
            }
            if (!weakSet.has(intView)) throw new Error("WeakSet missing int view");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempIntRef = new WeakRef(intView);
        const tempFloatRef = new WeakRef(floatView);
        buffer = null;
        intView = null;
        floatView = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Buffer not GC'd");
        if (tempIntRef.deref() !== undefined || tempFloatRef.deref() !== undefined) {
            throw new Error("Buffer views not GC'd");
        }

        return "Test Passed: WeakMixBufferConversionsTest015";
    },
    /**
     * 016. 缓存机制组合：WeakMap作为缓存，WeakSet跟踪缓存键
     */
    async test016_WeakMixCacheMechanism() {
        const cache = new WeakMap(); // 作为缓存
        const cacheKeys = new WeakSet(); // 跟踪缓存键
        let key1, key2, value1, value2, keyRefs;

        (function createCache() {
            key1 = { id: 'cache-key-1' };
            key2 = { id: 'cache-key-2' };
            value1 = { data: [1, 2, 3], timestamp: Date.now() };
            value2 = { data: [4, 5, 6], timestamp: Date.now() };

            // 填充缓存并跟踪键
            cache.set(key1, value1);
            cache.set(key2, value2);
            cacheKeys.add(key1);
            cacheKeys.add(key2);

            keyRefs = {
                key1: new WeakRef(key1),
                key2: new WeakRef(key2)
            };

            // 验证初始状态
            if (cache.get(key1) !== value1) throw new Error("Cache initialization failed");
            if (!cacheKeys.has(key2)) throw new Error("WeakSet missing cache key");
        })();

        // 清除强引用（模拟缓存键过期）
        const tempKey1Ref = keyRefs.key1;
        const tempKey2Ref = keyRefs.key2;
        const tempValue1Ref = new WeakRef(value1);
        key1 = null;
        key2 = null;
        value1 = null;
        value2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();

        // 验证回收情况
        if (tempKey1Ref.deref() !== undefined || tempKey2Ref.deref() !== undefined) {
            throw new Error("Cache keys not GC'd");
        }
        if (tempValue1Ref.deref() !== undefined) throw new Error("Cache values not GC'd");

        return "Test Passed: WeakMixCacheMechanismTest016";
    },

    /**
     * 017. 数组过滤组合：WeakSet存储原始数组，WeakMap关联过滤结果的WeakRef
     */
    async test017_WeakMixArrayFiltering() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, filteredArray, originalRef;

        (function createFilteredArray() {
            originalArray = [
                { id: 'item-1', value: 5 },
                { id: 'item-2', value: 15 },
                { id: 'item-3', value: 25 }
            ];

            // 过滤出value > 10的元素
            filteredArray = originalArray.filter(item => item.value > 10);
            filteredArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联过滤结果的WeakRef
            const filteredRef = new WeakRef(filteredArray);
            weakMap.set(originalArray, filteredRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (filteredArray.length !== 2) throw new Error("Array filtering failed");
            if (weakMap.get(originalArray)?.deref() !== filteredArray) {
                throw new Error("Filtered array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempFilteredRef = new WeakRef(filteredArray);
        originalArray = null;
        filteredArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempFilteredRef.deref() !== undefined) throw new Error("Filtered array not GC'd");

        return "Test Passed: WeakMixArrayFilteringTest017";
    },

    /**
     * 018. 集合映射组合：WeakMap存储Set，WeakSet存储映射后的元素
     */
    async test018_WeakMixSetMapping() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalSet, mappedElements, setRef;

        (function createSetMapping() {
            originalSet = new Set([1, 2, 3, 4, 5]);

            // 将集合元素映射为对象
            mappedElements = [];
            originalSet.forEach(num => {
                const obj = { value: num, squared: num * num };
                mappedElements.push(obj);
                weakSet.add(obj); // WeakSet存储映射后的元素
            });

            // WeakMap存储原始Set到映射元素的WeakRef
            const elementsRef = new WeakRef(mappedElements);
            weakMap.set(originalSet, elementsRef);

            setRef = new WeakRef(originalSet);

            // 验证初始状态
            if (mappedElements.length !== 5) throw new Error("Set mapping failed");
            if (!weakMap.has(originalSet)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetRef = setRef;
        const tempMappedRefs = mappedElements.map(el => new WeakRef(el));
        originalSet = null;
        mappedElements = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetRef.deref() !== undefined) throw new Error("Original set not GC'd");
        if (tempMappedRefs.some(ref => ref.deref() !== undefined)) {
            throw new Error("Mapped elements not GC'd");
        }

        return "Test Passed: WeakMixSetMappingTest018";
    },

    /**
     * 019. 复杂数据结构组合：WeakSet与WeakMap协同跟踪嵌套对象
     */
    async test019_WeakMixComplexStructure() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let rootObj, nodeA, nodeB, leaf1, leaf2, rootRef;

        (function createComplexStructure() {
            // 创建嵌套数据结构
            leaf1 = { type: 'leaf', value: 'data-1' };
            leaf2 = { type: 'leaf', value: 'data-2' };
            nodeA = { type: 'node', children: [leaf1] };
            nodeB = { type: 'node', children: [leaf2] };
            rootObj = {
                type: 'root',
                nodes: [nodeA, nodeB],
                metadata: { version: 1, timestamp: Date.now() }
            };

            // WeakSet跟踪所有节点和叶子
            [rootObj, nodeA, nodeB, leaf1, leaf2, rootObj.metadata].forEach(item => {
                weakSet.add(item);
            });

            // WeakMap建立层次引用
            weakMap.set(rootObj, new WeakRef({
                nodes: new WeakRef([nodeA, nodeB]),
                metadata: new WeakRef(rootObj.metadata)
            }));
            weakMap.set(nodeA, new WeakRef(leaf1));
            weakMap.set(nodeB, new WeakRef(leaf2));

            rootRef = new WeakRef(rootObj);

            // 验证初始状态
            if (!weakSet.has(rootObj.metadata)) throw new Error("WeakSet missing metadata");
            if (!weakMap.has(nodeA)) throw new Error("WeakMap missing nodeA");
        })();

        // 清除强引用
        const tempRootRef = rootRef;
        const tempLeaf1Ref = new WeakRef(leaf1);
        const tempLeaf2Ref = new WeakRef(leaf2);
        rootObj = null;
        nodeA = null;
        nodeB = null;
        leaf1 = null;
        leaf2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRootRef.deref() !== undefined) throw new Error("Root object not GC'd");
        if (tempLeaf1Ref.deref() !== undefined || tempLeaf2Ref.deref() !== undefined) {
            throw new Error("Leaf nodes not GC'd");
        }

        return "Test Passed: WeakMixComplexStructureTest019";
    },
    /**
     * 020. 缓存机制组合：WeakMap作为缓存，WeakSet跟踪缓存键
     */
    async test020_WeakMixCacheMechanism() {
        const cache = new WeakMap(); // 作为缓存
        let key1,  value1
        (function createCache() {
            key1 = { id: 'cache-key-1' };
            value1 = { data: [1, 2, 3], timestamp: Date.now() };
            // 填充缓存并跟踪键
            cache.set(key1, value1);
            // 验证初始状态
            // if (cache.get(key1) !== value1) throw new Error("Cache initialization failed");
        })();
        // 清除强引用（模拟缓存键过期）
        let tempValue1Ref = new WeakRef(value1);
        key1 = null;
        value1 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();
        await new Promise(resolve => setTimeout(resolve, 30));
        globalThis.ArkTools.forceFullGC();

        await new Promise(resolve => setTimeout(resolve, 30));


        if (tempValue1Ref.deref() !== undefined) throw new Error("Cache values not GC'd");
        return "Test Passed: WeakMixCacheMechanismTest020";
    },
    /**
     * 021. 函数对象组合：WeakSet存储函数，WeakMap关联函数结果的WeakRef
     */
    async test021_WeakMixFunctionResults() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let computeFn, resultObj, fnRef;

        (function createFunctionStructure() {
            // 创建带状态的计算函数
            computeFn = (function() {
                let callCount = 0;
                return function(input) {
                    callCount++;
                    return {
                        input,
                        result: input * 2,
                        calls: callCount,
                        source: computeFn
                    };
                };
            })();

            // 执行函数获取结果
            resultObj = computeFn(5);

            // WeakSet存储函数对象
            weakSet.add(computeFn);

            // WeakMap关联函数结果的WeakRef
            const resultRef = new WeakRef(resultObj);
            weakMap.set(computeFn, resultRef);

            fnRef = new WeakRef(computeFn);

            // 验证初始状态
            if (resultObj.result !== 10) throw new Error("Function result calculation failed");
            if (!weakSet.has(computeFn)) throw new Error("WeakSet missing function");
        })();

        // 清除强引用
        const tempFnRef = fnRef;
        const tempResultRef = new WeakRef(resultObj);
        computeFn = null;
        resultObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempFnRef.deref() !== undefined) throw new Error("Function not GC'd");
        if (tempResultRef.deref() !== undefined) throw new Error("Function result not GC'd");

        return "Test Passed: WeakMixFunctionResultsTest021";
    },

    /**
     * 022. 嵌套Map组合：WeakMap存储外层Map，WeakSet跟踪内层Map
     */
    async test022_WeakMixNestedMaps() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let outerMap, innerMap1, innerMap2, outerRef;

        (function createNestedMaps() {
            // 创建共享引用的键对象
            const keyA = { id: 'key-a' };
            const keyB = { id: 'key-b' };

            innerMap1 = new Map([[keyA, 'value-a']]);
            innerMap2 = new Map([[keyB, 'value-b']]);
            outerMap = new Map([
                ['inner1', innerMap1],
                ['inner2', innerMap2]
            ]);

            // WeakSet跟踪内层Map
            weakSet.add(innerMap1);
            weakSet.add(innerMap2);

            // WeakMap存储外层Map到内层WeakRef的映射
            const innerRefs = new WeakRef({
                first: new WeakRef(innerMap1),
                second: new WeakRef(innerMap2)
            });
            weakMap.set(outerMap, innerRefs);

            outerRef = new WeakRef(outerMap);

            // 验证初始状态
            if (innerMap1.get(keyA) !== 'value-a') throw new Error("Inner map initialization failed");
            if (!weakSet.has(innerMap2)) throw new Error("WeakSet missing inner map");
        })();

        // 清除强引用
        const tempOuterRef = outerRef;
        const tempInner1Ref = new WeakRef(innerMap1);
        const tempInner2Ref = new WeakRef(innerMap2);
        outerMap = null;
        innerMap1 = null;
        innerMap2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOuterRef.deref() !== undefined) throw new Error("Outer map not GC'd");
        if (tempInner1Ref.deref() !== undefined || tempInner2Ref.deref() !== undefined) {
            throw new Error("Inner maps not GC'd");
        }

        return "Test Passed: WeakMixNestedMapsTest022";
    },

    /**
     * 023. 数组映射组合：WeakSet存储原始数组，WeakMap关联映射结果的WeakRef
     */
    async test023_WeakMixArrayMapping() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, mappedArray, originalRef;

        (function createMappedArray() {
            originalArray = [1, 2, 3, 4, 5];

            // 创建映射数组（值加倍）
            mappedArray = originalArray.map(num => ({
                original: num,
                doubled: num * 2,
                source: originalArray
            }));

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联映射结果的WeakRef
            const mappedRef = new WeakRef(mappedArray);
            weakMap.set(originalArray, mappedRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (mappedArray[0].doubled !== 2) throw new Error("Array mapping failed");
            if (weakMap.get(originalArray)?.deref() !== mappedArray) {
                throw new Error("Mapped array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempMappedRef = new WeakRef(mappedArray);
        originalArray = null;
        mappedArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempMappedRef.deref() !== undefined) throw new Error("Mapped array not GC'd");

        return "Test Passed: WeakMixArrayMappingTest023";
    },

    /**
     * 024. 错误对象组合：WeakSet存储Error实例，WeakMap关联错误详情的WeakRef
     */
    async test024_WeakMixErrorObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let errorObj, errorDetails, errorRef;

        (function createErrorStructure() {
            errorObj = new Error("Test error message");
            errorObj.code = 500;

            // 创建错误详情对象
            errorDetails = {
                message: errorObj.message,
                code: errorObj.code,
                stack: errorObj.stack,
                source: errorObj
            };

            // WeakSet存储Error实例
            weakSet.add(errorObj);

            // WeakMap关联错误详情的WeakRef
            const detailsRef = new WeakRef(errorDetails);
            weakMap.set(errorObj, detailsRef);

            errorRef = new WeakRef(errorObj);

            // 验证初始状态
            if (errorDetails.code !== 500) throw new Error("Error details creation failed");
            if (!weakSet.has(errorObj)) throw new Error("WeakSet missing error object");
        })();

        // 清除强引用
        const tempErrorRef = errorRef;
        const tempDetailsRef = new WeakRef(errorDetails);
        errorObj = null;
        errorDetails = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempErrorRef.deref() !== undefined) throw new Error("Error object not GC'd");
        if (tempDetailsRef.deref() !== undefined) throw new Error("Error details not GC'd");

        return "Test Passed: WeakMixErrorObjectsTest024";
    },

    /**
     * 025. 集合交集组合：WeakMap使用两个Set作为键，WeakSet存储交集结果
     */
    async test025_WeakMixSetIntersection() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let setA, setB, intersectionSet, setARef, setBRef;

        (function createSetIntersection() {
            // 创建共享引用的对象
            const sharedObj = { id: 'shared' };
            const uniqueObjA = { id: 'unique-a' };
            const uniqueObjB = { id: 'unique-b' };

            setA = new Set([sharedObj, uniqueObjA]);
            setB = new Set([sharedObj, uniqueObjB]);

            // 计算交集 (A ∩ B)
            intersectionSet = new Set();
            setA.forEach(item => {
                if (setB.has(item)) intersectionSet.add(item);
            });

            // WeakSet存储交集结果
            intersectionSet.forEach(item => weakSet.add(item));

            // WeakMap使用Set组合作为键，存储交集的WeakRef
            const key = { setA, setB }; // 复合键对象
            const interRef = new WeakRef(intersectionSet);
            weakMap.set(key, interRef);

            setARef = new WeakRef(setA);
            setBRef = new WeakRef(setB);

            // 验证初始状态
            if (intersectionSet.size !== 1) throw new Error(`Set intersection size wrong (expected 1, got ${intersectionSet.size})`);
            if (!intersectionSet.has(sharedObj)) throw new Error("Set intersection missing shared object");
            if (!weakMap.has(key)) throw new Error("WeakMap missing set key");
        })();

        // 清除强引用
        const tempSetARef = setARef;
        const tempSetBRef = setBRef;
        const tempInterRef = new WeakRef(intersectionSet);
        setA = null;
        setB = null;
        intersectionSet = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempSetARef.deref() !== undefined || tempSetBRef.deref() !== undefined) {
            throw new Error("Original sets not GC'd");
        }
        if (tempInterRef.deref() !== undefined) throw new Error("Intersection set not GC'd");

        return "Test Passed: WeakMixSetIntersectionTest025";
    },

    /**
     * 026. 缓冲区切片组合：WeakSet存储原始缓冲区，WeakMap关联切片的WeakRef
     */
    async test026_WeakMixBufferSlices() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let buffer, slice1, slice2, bufferRef;

        (function createBufferSlices() {
            buffer = new ArrayBuffer(32); // 32字节缓冲区

            // 创建非重叠的缓冲区切片
            slice1 = buffer.slice(0, 16); // 前16字节
            slice2 = buffer.slice(16, 32); // 后16字节

            // 填充测试数据
            const view1 = new Uint8Array(slice1);
            view1.fill(0xAA);

            const view2 = new Uint8Array(slice2);
            view2.fill(0x55);

            // WeakSet存储原始缓冲区
            weakSet.add(buffer);

            // WeakMap关联切片的WeakRef
            const slicesRef = new WeakRef({
                first: new WeakRef(slice1),
                second: new WeakRef(slice2)
            });
            weakMap.set(buffer, slicesRef);

            bufferRef = new WeakRef(buffer);

            // 验证初始状态
            if (new Uint8Array(slice1)[0] !== 0xAA) throw new Error("First buffer slice initialization failed");
            if (new Uint8Array(slice2)[0] !== 0x55) throw new Error("Second buffer slice initialization failed");
            if (!weakSet.has(buffer)) throw new Error("WeakSet missing buffer");
        })();

        // 清除强引用
        const tempBufferRef = bufferRef;
        const tempSlice1Ref = new WeakRef(slice1);
        const tempSlice2Ref = new WeakRef(slice2);
        buffer = null;
        slice1 = null;
        slice2 = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempBufferRef.deref() !== undefined) throw new Error("Original buffer not GC'd");
        if (tempSlice1Ref.deref() !== undefined || tempSlice2Ref.deref() !== undefined) {
            throw new Error("Buffer slices not GC'd");
        }

        return "Test Passed: WeakMixBufferSlicesTest026";
    },

    /**
     * 027. 正则分组组合：WeakSet存储RegExp，WeakMap关联分组结果的WeakRef
     */
    async test027_WeakMixRegexGroups() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let regexObj, groupResults, regexRef;

        (function createRegexGroups() {
            // 使用命名分组的正则表达式
            regexObj = /(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/;
            const testString = "2024-03-15";

            // 执行匹配获取分组结果
            const match = regexObj.exec(testString);
            groupResults = {
                full: match[0],
                year: match.groups.year,
                month: match.groups.month,
                day: match.groups.day,
                source: regexObj
            };

            // WeakSet存储RegExp
            weakSet.add(regexObj);

            // WeakMap关联分组结果的WeakRef
            const groupsRef = new WeakRef(groupResults);
            weakMap.set(regexObj, groupsRef);

            regexRef = new WeakRef(regexObj);

            // 验证初始状态
            if (groupResults.year !== "2024") throw new Error("Regex group extraction failed");
            if (!weakSet.has(regexObj)) throw new Error("WeakSet missing regex");
        })();

        // 清除强引用
        const tempRegexRef = regexRef;
        const tempGroupsRef = new WeakRef(groupResults);
        regexObj = null;
        groupResults = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempRegexRef.deref() !== undefined) throw new Error("Regex not GC'd");
        if (tempGroupsRef.deref() !== undefined) throw new Error("Regex groups not GC'd");

        return "Test Passed: WeakMixRegexGroupsTest027";
    },

    /**
     * 028. 日期格式化组合：WeakMap存储Date，WeakSet跟踪格式化结果
     */
    async test028_WeakMixDateFormats() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let dateObj, formats, dateRef;

        (function createDateFormats() {
            dateObj = new Date('2024-03-15');

            // 创建多种格式化结果
            formats = {
                iso: dateObj.toISOString(),
                locale: dateObj.toLocaleDateString('en-US'),
                utc: dateObj.toUTCString(),
                source: dateObj
            };

            // WeakSet跟踪格式化结果对象
            weakSet.add(formats);

            // WeakMap存储Date到格式化结果的WeakRef
            const formatsRef = new WeakRef(formats);
            weakMap.set(dateObj, formatsRef);

            dateRef = new WeakRef(dateObj);

            // 验证初始状态
            if (!formats.iso.startsWith('2024-03-15')) throw new Error("Date formatting failed");
            if (!weakSet.has(formats)) throw new Error("WeakSet missing formats");
        })();

        // 清除强引用
        const tempDateRef = dateRef;
        const tempFormatsRef = new WeakRef(formats);
        dateObj = null;
        formats = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempDateRef.deref() !== undefined) throw new Error("Date object not GC'd");
        if (tempFormatsRef.deref() !== undefined) throw new Error("Date formats not GC'd");

        return "Test Passed: WeakMixDateFormatsTest028";
    },

    /**
     * 029. 类继承组合：WeakSet存储子类实例，WeakMap关联父类实例的WeakRef
     */
    async test029_WeakMixClassInheritance() {
        // 定义父类和子类
        class Parent {
            constructor(id) {
                this.id = id;
                this.parentData = `parent-${id}`;
            }
        }

        class Child extends Parent {
            constructor(id) {
                super(id);
                this.childData = `child-${id}`;
            }
        }

        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let parentObj, childObj, childRef;

        (function createClassInstances() {
            parentObj = new Parent('029');
            childObj = new Child('029');

            // WeakSet存储子类实例
            weakSet.add(childObj);

            // WeakMap关联父类实例的WeakRef
            const parentRef = new WeakRef(parentObj);
            weakMap.set(childObj, parentRef);

            childRef = new WeakRef(childObj);

            // 验证初始状态
            if (!(childObj instanceof Parent)) throw new Error("Class inheritance failed");
            if (!weakSet.has(childObj)) throw new Error("WeakSet missing child instance");
        })();

        // 清除强引用
        const tempChildRef = childRef;
        const tempParentRef = new WeakRef(parentObj);
        parentObj = null;
        childObj = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempChildRef.deref() !== undefined) throw new Error("Child instance not GC'd");
        if (tempParentRef.deref() !== undefined) throw new Error("Parent instance not GC'd");

        return "Test Passed: WeakMixClassInheritanceTest029";
    },

    /**
     * 030. 数组排序组合：WeakSet存储原始数组，WeakMap关联排序结果的WeakRef
     */
    async test030_WeakMixArraySorting() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let originalArray, sortedArray, originalRef;

        (function createSortedArray() {
            originalArray = [3, 1, 4, 2, 5];

            // 创建排序后的数组（不修改原数组）
            sortedArray = [...originalArray].sort((a, b) => a - b);
            sortedArray.source = originalArray;

            // WeakSet存储原始数组
            weakSet.add(originalArray);

            // WeakMap关联排序结果的WeakRef
            const sortedRef = new WeakRef(sortedArray);
            weakMap.set(originalArray, sortedRef);

            originalRef = new WeakRef(originalArray);

            // 验证初始状态
            if (sortedArray[0] !== 1 || sortedArray[4] !== 5) throw new Error("Array sorting failed");
            if (weakMap.get(originalArray)?.deref() !== sortedArray) {
                throw new Error("Sorted array WeakRef mismatch");
            }
        })();

        // 清除强引用
        const tempOriginalRef = originalRef;
        const tempSortedRef = new WeakRef(sortedArray);
        originalArray = null;
        sortedArray = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempOriginalRef.deref() !== undefined) throw new Error("Original array not GC'd");
        if (tempSortedRef.deref() !== undefined) throw new Error("Sorted array not GC'd");

        return "Test Passed: WeakMixArraySortingTest030";
    },

    /**
     * 031. Map过滤组合：WeakMap存储原始Map，WeakSet跟踪过滤后的条目
     */
    async test031_WeakMixMapFiltering() {
        const weakMap = new WeakMap();
        const weakSet = new WeakSet();
        let originalMap, filteredEntries, mapRef;

        (function createFilteredMap() {
            // 创建共享引用的键对象
            const key1 = { id: 'k1', value: 5 };
            const key2 = { id: 'k2', value: 15 };
            const key3 = { id: 'k3', value: 25 };

            originalMap = new Map([
                [key1, { data: 'val1' }],
                [key2, { data: 'val2' }],
                [key3, { data: 'val3' }]
            ]);

            // 过滤出value > 10的键对应的条目
            filteredEntries = [];
            originalMap.forEach((value, key) => {
                if (key.value > 10) {
                    const entry = { key, value };
                    filteredEntries.push(entry);
                    weakSet.add(entry); // WeakSet跟踪过滤条目
                }
            });

            // WeakMap存储原始Map到过滤条目的WeakRef
            const entriesRef = new WeakRef(filteredEntries);
            weakMap.set(originalMap, entriesRef);

            mapRef = new WeakRef(originalMap);

            // 验证初始状态
            if (filteredEntries.length !== 2) throw new Error(`Map filtering failed (expected 2 entries, got ${filteredEntries.length})`);
            if (!weakMap.has(originalMap)) throw new Error("WeakMap missing map key");
        })();

        // 清除强引用
        const tempMapRef = mapRef;
        const tempEntriesRef = new WeakRef(filteredEntries);
        originalMap = null;
        filteredEntries = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempMapRef.deref() !== undefined) throw new Error("Original map not GC'd");
        if (tempEntriesRef.deref() !== undefined) throw new Error("Filtered entries not GC'd");

        return "Test Passed: WeakMixMapFilteringTest031";
    },

    /**
     * 032. 类型化数组组合：WeakSet存储TypedArray，WeakMap关联视图的WeakRef
     */
    async test032_WeakMixTypedArrays() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let intArray, floatView, arrayRef;

        (function createTypedArrays() {
            // 创建32位整数数组
            intArray = new Int32Array(4);
            intArray.set([10, 20, 30, 40]);

            // 创建共享缓冲区的浮点视图
            floatView = new Float32Array(intArray.buffer);

            // WeakSet存储原始类型化数组
            weakSet.add(intArray);

            // WeakMap关联浮点视图的WeakRef
            const viewRef = new WeakRef(floatView);
            weakMap.set(intArray, viewRef);

            arrayRef = new WeakRef(intArray);

            // 验证初始状态（不比较值，只验证引用）
            if (intArray.buffer !== floatView.buffer) throw new Error("Typed arrays buffer mismatch");
            if (!weakSet.has(intArray)) throw new Error("WeakSet missing typed array");
        })();

        // 清除强引用
        const tempArrayRef = arrayRef;
        const tempViewRef = new WeakRef(floatView);
        intArray = null;
        floatView = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempArrayRef.deref() !== undefined) throw new Error("Typed array not GC'd");
        if (tempViewRef.deref() !== undefined) throw new Error("Float view not GC'd");

        return "Test Passed: WeakMixTypedArraysTest032";
    },

    /**
     * 033. 字符串对象组合：WeakSet存储String对象，WeakMap关联处理结果的WeakRef
     */
    async test033_WeakMixStringObjects() {
        const weakSet = new WeakSet();
        const weakMap = new WeakMap();
        let strObj, processedStr, strRef;

        (function createStringObjects() {
            // 使用String对象（非原始值）
            strObj = new String("Hello WeakMix");

            // 处理字符串
            processedStr = {
                original: strObj,
                length: strObj.length,
                uppercase: strObj.toUpperCase(),
                words: strObj.split(' ')
            };

            // WeakSet存储String对象
            weakSet.add(strObj);

            // WeakMap关联处理结果的WeakRef
            strRef = new WeakRef(processedStr);
            weakMap.set(strObj, strRef);

            strRef = new WeakRef(strObj);

            // 验证初始状态
            if (processedStr.uppercase !== "HELLO WEAKMIX") throw new Error("String processing failed");
            if (!weakSet.has(strObj)) throw new Error("WeakSet missing string object");
        })();

        // 清除强引用
        const tempStrRef = strRef;
        const tempProcessedRef = new WeakRef(processedStr);
        strObj = null;
        processedStr = null;

        // 触发GC
        await new Promise(resolve => setTimeout(resolve, 30));
        if (globalThis.ArkTools?.forceFullGC) globalThis.ArkTools.forceFullGC();
        else if (global.gc) global.gc();
        await new Promise(resolve => setTimeout(resolve, 30));

        // 验证回收情况
        if (tempStrRef.deref() !== undefined) throw new Error("String object not GC'd");
        if (tempProcessedRef.deref() !== undefined) throw new Error("Processed string not GC'd");

        return "Test Passed: WeakMixStringObjectsTest033";
    },

    /**
     * 034. 多层缓存组合：WeakMap嵌套作为多层缓存，WeakSet跟踪缓存键
     */
    async test034_WeakMixMultiLevelCache() {
        // 第一层缓存：key为对象，value为第二层WeakMap
        const level1Cache = new WeakMap();
        // 跟踪所有层级的缓存键
        const cacheKeys = new WeakSet();

        let key1, key2, subKey1, subKey2, value1, value2;

        (function createMultiLevelCache() {
  