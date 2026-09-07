# ArkTSUtils.SendableLruCache 最终测试点报告

## 文件清单
| # | 文件 | 活跃用例 | 注释用例 | 总计 |
| --- | --- | --- | --- | --- |
| 1 | SendableLruCacheConstructor.test.ets | 12 | 0 | 12 |
| 2 | SendableLruCachePut.test.ets | 15 | 0 | 15 |
| 3 | SendableLruCacheGet.test.ets | 7 | 0 | 7 |
| 4 | SendableLruCacheRemove.test.ets | 8 | 0 | 8 |
| 5 | SendableLruCacheClear.test.ets | 10 | 0 | 10 |
| 6 | SendableLruCacheContains.test.ets | 7 | 0 | 7 |
| 7 | SendableLruCacheKeysValues.test.ets | 10 | 0 | 10 |
| 8 | SendableLruCacheLengthEmpty.test.ets | 28 | 0 | 28 |
| 9 | SendableLruCacheToStringEntries.test.ets | 10 | 0 | 10 |
| 10 | SendableLruCacheCapacity.test.ets | 12 | 0 | 12 |
| 11 | SendableLruCacheCounts.test.ets | 27 | 0 | 27 |
| 12 | SendableLruCacheCreateDefault.test.ets | 10 | 0 | 10 |
| 13 | SendableLruCacheConcurrent.test.ets | 33 | 0 | 33 |
| **合计** | **13个文件** | **189** | **0** | **189** |

---

## 1. SendableLruCacheConstructor.test.ets (12用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheConstrcutor001 | constructor | 无 | new SendableLruCache(0.1) 传小数capacity，期望抛出"must be small integer"异常 |
| 2 | testSendableLRUCacheConstrcutor002 | constructor | 无 | new SendableLruCache(-0.1) 传负小数capacity，期望抛出"must be small integer"异常 |
| 3 | testSendableLRUCacheCapacityBoundary001 | constructor/getCapacity | new SendableLruCache(2147483647) | 构造传int最大值边界，getCapacity返回2147483647 |
| 4 | testSendableLRUCacheCapacityBoundary002 | constructor | 无 | new SendableLruCache(0) 传0，期望抛出异常 |
| 5 | testSendableLRUCacheCapacityBoundary003 | constructor | 无 | new SendableLruCache(-5) 传负整数，期望抛出异常 |
| 6 | testSendableLRUCacheCapacityBoundary004 | constructor | 无 | new SendableLruCache(NaN) 传NaN，期望抛出异常 |
| 7 | testSendableLRUCacheCapacityBoundary005 | constructor | 无 | new SendableLruCache(Infinity) 传Infinity，期望抛出异常 |
| 8 | testSendableLRUCacheCapacityBoundary006 | updateCapacity | new SendableLruCache(100) | updateCapacity(0) 传0，期望抛出异常 |
| 9 | testSendableLRUCacheCapacityBoundary007 | updateCapacity/getCapacity | new SendableLruCache() 默认容量 | updateCapacity(2147483647)，getCapacity返回2147483647 |
| 10 | testSendableLRUCacheCapacityBoundary008 | updateCapacity | new SendableLruCache(100) | updateCapacity(NaN)，期望抛出异常 |
| 11 | testSendableLRUCacheCapacityBoundary009 | constructor/getCapacity/put/contains/length | new SendableLruCache(1) 最小有效容量 | put两条仅保留最近一条，length=1，contains(1)=false、contains(2)=true |
| 12 | testSendableLRUCacheCapacityBoundary010 | updateCapacity/getCapacity/contains/length | new SendableLruCache(10)，已put(1)(2)(3) | updateCapacity(1)收缩到最小，length=1，contains(3)=true、contains(1)=false |

---

## 2. SendableLruCachePut.test.ets (15用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCachePut001 | put | new SendableLruCache() | put('1111','bcjdshc')，返回值等于写入值 |
| 2 | testSendableLRUCachePut002 | put | new SendableLruCache() | put('1111',str)后再put('1111',13)，覆盖同key返回13 |
| 3 | testSendableLRUCachePut003 | put | new SendableLruCache() | put多组混合类型键值，各自返回写入值 |
| 4 | testSendableLRUCachePut004 | put/updateCapacity | new SendableLruCache() | put后updateCapacity(2)再put，触发淘汰仍正常返回 |
| 5 | testSendableLRUCachePut005 | put | new SendableLruCache() | 同key多次put更新值，每次返回最新值 |
| 6 | testSendableLRUCachePut006 | put | new SendableLruCache() | put(undefined,value)，期望抛出"undefined must be Object"异常 |
| 7 | testSendableLRUCachePut007 | put | new SendableLruCache() | put(null,value)，期望抛出"key and value must be Object"异常 |
| 8 | testSendableLRUCachePut008 | put | new SendableLruCache() | put(123,null)，期望抛出"key and value must be Object"异常 |
| 9 | testSendableLRUCachePutUpdateOrder001 | put/contains/get | new SendableLruCache(2) | put(1)(2)(1,100)(3)，同key新值刷新LRU位置，淘汰key2，contains(1)=true、contains(2)=false，get(1)=100 |
| 10 | testSendableLRUCacheValueBoundary001 | put/get/contains | new SendableLruCache() | put(1,0)边界值0，返回0、get=0、contains=true |
| 11 | testSendableLRUCacheValueBoundary002 | put/get | new SendableLruCache() | put(1,MAX_SAFE_INTEGER)，返回并get等于MAX_SAFE_INTEGER |
| 12 | testSendableLRUCacheValueBoundary003 | put/get | new SendableLruCache() | put(1,MIN_SAFE_INTEGER)，返回并get等于MIN_SAFE_INTEGER |
| 13 | testSendableLRUCacheValueBoundary004 | put/get | new SendableLruCache() | put(1,-0)负零边界，返回0、get=0 |
| 14 | testSendableLRUCacheSameValue001 | put/get/values | new SendableLruCache() | 不同key同值100，values()含3个100 |
| 15 | testSendableLRUCacheSameValue002 | put/length/getPutCount/get | new SendableLruCache() | 同key同值put3次，length=1，putCount=3，get=100 |

---

## 3. SendableLruCacheGet.test.ets (7用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheGet001 | get/put | new SendableLruCache(100)，已put(1,2) | get(1)返回2 |
| 2 | testSendableLRUCacheGet002 | get/put | new SendableLruCache(100)，已put(1,2) | get(5)不存在的key返回undefined |
| 3 | testSendableLRUCacheGet003 | get/put | new SendableLruCache(100)，已put(1)(2)('abcd') | get混合存在与不存在key，命中返回值、未命中返回undefined |
| 4 | testSendableLRUCacheGet004 | get/put | new SendableLruCache()，已put多组混合类型 | get四组混合类型键，命中返回值、未命中返回undefined |
| 5 | testSendableLRUCacheGet005 | get/put/updateCapacity | new SendableLruCache()，updateCapacity(2)后淘汰 | updateCapacity(2)后put('abcd')淘汰'1111'，get('1111')=undefined、其余命中 |
| 6 | testSendableLRUCacheGet006 | get | new SendableLruCache()，已put(20) | get(undefined)，期望抛出"undefined must be Object"异常 |
| 7 | testSendableLRUCacheGet007 | get | new SendableLruCache()，已put(20) | get(null)，期望抛出"null must be Object"异常 |

---

## 4. SendableLruCacheRemove.test.ets (8用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheRemove001 | remove/put | new SendableLruCache()，已put(1,2) | remove(1)返回2 |
| 2 | testSendableLRUCacheRemove002 | remove/put | new SendableLruCache()，已put(1)('abcd') | remove两个key各自返回对应值 |
| 3 | testSendableLRUCacheRemove003 | remove/put | new SendableLruCache()，已put(1,2) | remove存在key返回值，remove不存在key返回undefined |
| 4 | testSendableLRUCacheRemove004 | remove/put | new SendableLruCache()，已put(0)('abcd') | remove不存在的1返回undefined，remove('abcd')返回20 |
| 5 | testSendableLRUCacheRemove005 | remove/get/put | new SendableLruCache()，已put(1)(3)(5) | remove(1)(3)返回值，get(3)返回undefined验证已删除 |
| 6 | testSendableLRUCacheRemove006 | remove/put | new SendableLruCache()，已put(1,2) | remove(undefined)，期望抛出"undefined must be Object"异常 |
| 7 | testSendableLRUCacheRemove007 | remove/put | new SendableLruCache()，已put(1,2) | remove(null)，期望抛出"null must be Object"异常 |
| 8 | sendableLruCacheRemoveReturnValidation001 | remove/put/get | new SendableLruCache()，已put("key1")("key2") | remove存在key返回值，remove不存在key返回undefined，get验证已删除 |

---

## 5. SendableLruCacheClear.test.ets (10用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheClear001 | clear/put/length | new SendableLruCache()，已put(1,2) | clear前后length由1变0 |
| 2 | testSendableLRUCacheClear002 | clear/put/length | new SendableLruCache()，已put4条 | clear前后length由4变0 |
| 3 | testSendableLRUCacheClear003 | clear/put/length | new SendableLruCache()，已put4条混合类型 | clear前后length由4变0 |
| 4 | testSendableLRUCacheClear004 | clear/updateCapacity/put/length | new SendableLruCache()，put3条后updateCapacity(3) | clear前后length由3变0 |
| 5 | testSendableLRUCacheClear005 | clear/updateCapacity/put/length | new SendableLruCache()，put4条后updateCapacity(2)淘汰 | clear前后length由2变0 |
| 6 | testSendableLRUCacheClearStats001 | clear/put/get/length/isEmpty/getMatchCount/getMissCount/getPutCount/getRemoveCount | new SendableLruCache()，put(1)(2)、get(1)命中、get(3)未命中 | clear后length=0、isEmpty=true，但match/miss/put/remove计数保留不变，后续操作在保留值上累加 |
| 7 | testSendableLRUCacheClearStats002 | clear/put/get/keys/getCapacity/getPutCount/getMatchCount/getMissCount/getRemoveCount/getCreateCount | new SendableLruCache(2)，put(1)(2)(3)淘汰1、get(2)命中、get(99)未命中 | clear后length=0、capacity不变、所有统计计数保留，后续put/get/淘汰在保留值上累加 |
| 8 | testSendableLRUCacheClearStats003 | clear/put/get/getCreateCount/getPutCount | CreateDefaultLruCache(createDefault返回key+100)，put(1)、get(5)(7)触发createDefault | clear后createCount保留，get(9)再次触发createDefault在保留值上+1 |
| 9 | testSendableLRUCacheClearStats004 | clear/put/get/toString | new SendableLruCache()，put(1)、get(1)命中、get(2)未命中 | clear后toString输出与clear前完全相同（计数保留不重置） |
| 10 | testSendableLRUCacheClearStats005 | put/remove/getRemoveCount/length | new SendableLruCache(3)，put(1)(2)(3) | 手动remove(2)不增加removeCount，仅容量超限淘汰时removeCount+1 |

---

## 6. SendableLruCacheContains.test.ets (7用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheContains001 | contains/put | new SendableLruCache()，已put(1,2) | contains(1)返回true |
| 2 | testSendableLRUCacheContains002 | contains/put | new SendableLruCache()，已put(0,5) | contains(0)边界key返回true |
| 3 | testSendableLRUCacheContains003 | contains/put | new SendableLruCache()，已put('abc') | contains(1)不存在返回false |
| 4 | testSendableLRUCacheContains004 | contains/put | new SendableLruCache()，已put(1)('abcd') | contains(1)=true，contains(20)=false |
| 5 | testSendableLRUCacheContains005 | contains/put | new SendableLruCache()，已put(1)('string') | contains混合存在与不存在，命中true、未命中false |
| 6 | testSendableLRUCacheContains006 | contains/put | new SendableLruCache()，已put('abc') | contains(undefined)，期望抛出"undefined must be Object"异常 |
| 7 | testSendableLRUCacheContainsAfterRemove001 | contains/remove/put/length | new SendableLruCache()，put(1,10) | remove前contains=true，remove后contains=false、length=0 |

---

## 7. SendableLruCacheKeysValues.test.ets (10用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheKeys001 | keys/put | new SendableLruCache()，已put('string','abc') | keys()返回['string'] |
| 2 | testSendableLRUCacheKeys002 | keys/put | new SendableLruCache()，已put(1)(3)(5)('abc') | keys()按插入顺序返回4个key |
| 3 | testSendableLRUCacheKeys003 | keys/get/put | new SendableLruCache()，put4条后get(3) | get刷新LRU位置，keys()中key3移到末尾 |
| 4 | testSendableLRUCacheKeys004 | keys/get/contains/put | new SendableLruCache()，put4条后get(3)、contains(1) | get与contains均刷新位置，keys()顺序随之调整 |
| 5 | testSendableLRUCacheKeys005 | keys/get/remove/contains/put | new SendableLruCache()，put4条后混合get/remove/contains | 多操作后keys()反映最新LRU顺序且不含已remove的key |
| 6 | testSendableLRUCacheValues001 | values/put | new SendableLruCache()，已put('string','abc') | values()返回['abc'] |
| 7 | testSendableLRUCacheValues002 | values/put | new SendableLruCache()，已put4条 | values()按插入顺序返回4个value |
| 8 | testSendableLRUCacheValues003 | values/get/put | new SendableLruCache()，put4条后get(3) | get刷新位置，values()中对应value移到末尾 |
| 9 | testSendableLRUCacheValues004 | values/get/contains/put | new SendableLruCache()，put4条后get(3)、contains(1) | get与contains刷新位置，values()顺序随之调整 |
| 10 | testSendableLRUCacheValues005 | values/get/remove/contains/put | new SendableLruCache()，put4条后混合get/remove/contains | 多操作后values()反映最新LRU顺序且不含已remove的项 |

---

## 8. SendableLruCacheLengthEmpty.test.ets (28用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheLength001 | length | new SendableLruCache() 空缓存 | length返回0 |
| 2 | testSendableLRUCacheLength002 | length/put | new SendableLruCache()，put(1,2) | length返回1 |
| 3 | testSendableLRUCacheLength003 | length/put | new SendableLruCache()，put2条 | length返回2 |
| 4 | testSendableLRUCacheLength004 | length/put | new SendableLruCache()，put('abcd')两次 | 同key覆盖，length返回3 |
| 5 | testSendableLRUCacheLength005 | length/updateCapacity/put | new SendableLruCache()，put后updateCapacity(3)再put | 容量受限淘汰后length=3 |
| 6 | testSendableLRUCacheIsEmpty001 | isEmpty/put | new SendableLruCache()，put(1,2) | isEmpty返回false |
| 7 | testSendableLRUCacheIsEmpty002 | isEmpty/put | new SendableLruCache()，put2条 | isEmpty返回false |
| 8 | testSendableLRUCacheIsEmpty003 | isEmpty/put | new SendableLruCache()，put3条 | isEmpty返回false |
| 9 | testSendableLRUCacheIsEmpty004 | isEmpty/put | new SendableLruCache()，put3条混合类型 | isEmpty返回false |
| 10 | testSendableLRUCacheIsEmpty005 | isEmpty/clear/put | new SendableLruCache()，put3条后clear | clear后isEmpty返回true |
| 11 | testSendableLRUCacheEmpty001 | keys | new SendableLruCache() 空缓存 | keys()返回空数组，length=0 |
| 12 | testSendableLRUCacheEmpty002 | values | new SendableLruCache() 空缓存 | values()返回空数组，length=0 |
| 13 | testSendableLRUCacheEmpty003 | entries | new SendableLruCache() 空缓存 | entries()迭代无项，count=0 |
| 14 | testSendableLRUCacheEmpty004 | toString | new SendableLruCache() 空缓存 | toString返回'maxSize = 64, hits = 0, misses = 0, hitRate = 0%' |
| 15 | testSendableLRUCacheKeyBoundary001 | put/get/contains/keys/remove | new SendableLruCache<string,number>() | 空字符串''作key，get/contains/keys/remove均正常工作 |
| 16 | testSendableLRUCacheKeyBoundary002 | put/get/contains | new SendableLruCache<string,number>() | 1000字符长字符串作key，get/contains正常 |
| 17 | testSendableLRUCacheKeyBoundary003 | put/get/contains/remove | new SendableLruCache<number,number>() | 0作数字key边界值，get/contains/remove正常 |
| 18 | testSendableLRUCacheRepeat001 | get/getMatchCount/getMissCount/put | new SendableLruCache()，put(1,10) | 重复get同key3次，matchCount=3、missCount=0 |
| 19 | testSendableLRUCacheRepeat002 | contains/getMatchCount/put | new SendableLruCache()，put(1,10) | 重复contains同key2次，matchCount=2 |
| 20 | testSendableLRUCacheRepeat003 | remove/put | new SendableLruCache()，put(1,10) | 重复remove同key，第二次返回undefined、length=0 |
| 21 | testSendableLRUCacheRepeat004 | clear/length/isEmpty/put | new SendableLruCache()，put(1,10) | 重复clear，length保持0、isEmpty=true |
| 22 | testSendableLRUCacheRepeat005 | updateCapacity/getCapacity/put/length | new SendableLruCache(50) | 重复updateCapacity(20)同值，capacity保持20、put后length=2 |
| 23 | testSendableLRUCacheEmptyOperation001 | isEmpty/length | new SendableLruCache() 空缓存 | 新建空缓存isEmpty=true、length=0 |
| 24 | testSendableLRUCacheEmptyOperation002 | get/getMissCount | new SendableLruCache() 空缓存 | get任意key返回undefined、missCount=1 |
| 25 | testSendableLRUCacheEmptyOperation003 | remove/length/isEmpty | new SendableLruCache() 空缓存 | remove任意key返回undefined、length=0、isEmpty=true |
| 26 | testSendableLRUCacheEmptyOperation004 | contains/length | new SendableLruCache() 空缓存 | contains任意key返回false、length=0 |
| 27 | testSendableLRUCacheEmptyOperation005 | getMatchCount/getMissCount/getPutCount/getRemoveCount/getCreateCount | new SendableLruCache() 空缓存 | 新建空缓存所有统计计数均为0 |
| 28 | sendableLruCacheEmptyString001 | put/get/contains/remove | new SendableLruCache<string,number>() | 空字符串key的put/get/contains/remove全流程，remove后get返回undefined |

---

## 9. SendableLruCacheToStringEntries.test.ets (10用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheToString001 | toString/put | new SendableLruCache()，put2条 | 无命中，toString为'maxSize=64,hits=0,misses=0,hitRate=0%' |
| 2 | testSendableLRUCacheToString002 | toString/get/put | new SendableLruCache()，put2条后get(1)('1111') | 2次命中，toString为'hits=2,misses=0,hitRate=100%' |
| 3 | testSendableLRUCacheToString003 | toString/get/put | new SendableLruCache(100)，put4条后get(3) | capacity=100、1次命中，toString为'hits=1,misses=0,hitRate=100%' |
| 4 | testSendableLRUCacheToString004 | toString/get/put | new SendableLruCache(100)，put4条后get(3)命中、get(2)未命中 | 1命中1未命中，toString为'hits=1,misses=1,hitRate=50%' |
| 5 | testSendableLRUCacheToString005 | toString/get/contains/put | new SendableLruCache(100)，put4条后多次get/contains | 3命中1未命中，toString为'hits=3,misses=1,hitRate=75%' |
| 6 | testSendableLRUCacheEntries001 | entries/put | new SendableLruCache<string,string>()，put('string','abc') | entries()迭代取到value='abc' |
| 7 | testSendableLRUCacheEntries002 | entries/put | new SendableLruCache()，put4条 | entries()迭代键值对，arr[1]=2 |
| 8 | testSendableLRUCacheEntries003 | entries/get/put | new SendableLruCache()，put4条后get(3) | get刷新位置，entries()首项为key1，arr[0]=1 |
| 9 | testSendableLRUCacheEntries004 | entries/get/contains/put | new SendableLruCache()，put4条后get(3)、contains(1) | get与contains刷新位置，entries()中arr[1]=15、arr[3]=20 |
| 10 | testSendableLRUCacheEntries005 | entries/get/remove/contains/put | new SendableLruCache()，put4条后get(3)、remove(5)、contains(3)、get(1)、contains('abc') | 多操作后entries()反映最新顺序，arr[1]=10、arr[3]=2、arr[5]=20 |

---

## 10. SendableLruCacheCapacity.test.ets (12用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheUpdateGetCapacity001 | updateCapacity/getCapacity | new SendableLruCache() 默认容量 | updateCapacity(10)，getCapacity返回10 |
| 2 | testSendableLRUCacheUpdateGetCapacity002 | updateCapacity/getCapacity | new SendableLruCache() | updateCapacity(2147483646)大值边界，getCapacity返回同值 |
| 3 | testSendableLRUCacheUpdateGetCapacity003 | updateCapacity/getCapacity | new SendableLruCache(100) | updateCapacity(20)缩小，getCapacity返回20 |
| 4 | testSendableLRUCacheUpdateGetCapacity004 | updateCapacity/getCapacity | new SendableLruCache(50) | updateCapacity(2)缩到很小，getCapacity返回2 |
| 5 | testSendableLRUCacheUpdateGetCapacity005 | updateCapacity/getCapacity | new SendableLruCache(200) | updateCapacity(100)缩小，getCapacity返回100 |
| 6 | testSendableLRUCacheGetCapacity001 | getCapacity | new SendableLruCache() 默认容量 | getCapacity返回默认64 |
| 7 | testSendableLRUCacheGetCapacity002 | getCapacity | new SendableLruCache(2) | getCapacity返回2 |
| 8 | testSendableLRUCacheGetCapacity003 | getCapacity | new SendableLruCache(100) | getCapacity返回100 |
| 9 | testSendableLRUCacheGetCapacity004 | getCapacity/updateCapacity | new SendableLruCache() | updateCapacity(50)后getCapacity返回50 |
| 10 | testSendableLRUCacheGetCapacity005 | getCapacity/updateCapacity | new SendableLruCache(100) | updateCapacity(10)后getCapacity返回10 |
| 11 | testSendableLRUCacheUpdateGetCapacity007 | updateCapacity | new SendableLruCache(200) | updateCapacity(-20)负数，期望抛出"must be small integer"异常 |
| 12 | testSendableLRUCacheUpdateGetCapacity008 | updateCapacity | new SendableLruCache(200) | updateCapacity(50.5)小数，期望抛出"must be small integer"异常 |

---

## 11. SendableLruCacheCounts.test.ets (27用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheGetCreateCount001 | getCreateCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 默认createDefault返回undefined，createCount=0 |
| 2 | testSendableLRUCacheGetCreateCount002 | getCreateCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 不同key未命中，createCount=0 |
| 3 | testSendableLRUCacheGetCreateCount003 | getCreateCount/get/put | new SendableLruCache()，put2条后get2个字符串不存在key | 字符串key未命中，createCount=0 |
| 4 | testSendableLRUCacheGetCreateCount004 | getCreateCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 混合类型未命中，createCount=0 |
| 5 | testSendableLRUCacheGetCreateCount005 | getCreateCount/get/put | new SendableLruCache()，put3条后get3个数字不存在key | 数字key未命中，createCount=0 |
| 6 | testSendableLRUCacheGetMissCount001 | getMissCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 3次未命中，missCount=3 |
| 7 | testSendableLRUCacheGetMissCount002 | getMissCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 3次未命中，missCount=3 |
| 8 | testSendableLRUCacheGetMissCount003 | getMissCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 3次未命中，missCount=3 |
| 9 | testSendableLRUCacheGetMissCount004 | getMissCount/get/put | new SendableLruCache()，put3条后get3个不存在key | 字符串+数字混合未命中，missCount=3 |
| 10 | testSendableLRUCacheGetMissCount005 | getMissCount/get/contains/put | new SendableLruCache()，put3条后get3未命中、contains2其中1未命中 | get与contains未命中合计，missCount=4 |
| 11 | testSendableLRUCacheGetMissCount006 | getMissCount/get/put | new SendableLruCache()，put3条后get3个存在key | 全部命中，missCount=0 |
| 12 | testSendableLRUCacheGetRemoveCount001 | getRemoveCount/put | new SendableLruCache() 默认容量64，put5条 | 未超容量无淘汰，removeCount=0 |
| 13 | testSendableLRUCacheGetRemoveCount002 | getRemoveCount/put | new SendableLruCache()，put4条 | 未超容量无淘汰，removeCount=0 |
| 14 | testSendableLRUCacheGetRemoveCount003 | getRemoveCount/put | new SendableLruCache()，put3条 | 未超容量无淘汰，removeCount=0 |
| 15 | testSendableLRUCacheGetRemoveCount004 | getRemoveCount/updateCapacity/put | new SendableLruCache()，put3条后updateCapacity(2)再put2条 | 缩容淘汰，removeCount=3 |
| 16 | testSendableLRUCacheGetRemoveCount005 | getRemoveCount/updateCapacity/put | new SendableLruCache()，put3条后updateCapacity(3)再put3条 | 缩容淘汰，removeCount=3 |
| 17 | testSendableLRUCacheGetMatchCount001 | getMatchCount/get/put | new SendableLruCache()，put3条后get3个存在key | 3次命中，matchCount=3 |
| 18 | testSendableLRUCacheGetMatchCount002 | getMatchCount/get/put | new SendableLruCache()，put3条后get3命中1未命中 | 3次命中，matchCount=3 |
| 19 | testSendableLRUCacheGetMatchCount003 | getMatchCount/get/put | new SendableLruCache()，put3条含key0后get3命中 | 含边界key0命中，matchCount=3 |
| 20 | testSendableLRUCacheGetMatchCount004 | getMatchCount/get/contains/put | new SendableLruCache()，put3条后get3命中、contains3其中1未命中 | get与contains命中合计，matchCount=5 |
| 21 | testSendableLRUCacheGetMatchCount005 | getMatchCount/get/contains/put | new SendableLruCache()，put4条后get4命中、contains4其中1未命中 | get与contains命中合计，matchCount=7 |
| 22 | testSendableLRUCacheGetMatchCount006 | getMatchCount/get/put | new SendableLruCache()，put3条后get1个不存在key | 全未命中，matchCount=0 |
| 23 | testSendableLRUCacheGetPutCount001 | getPutCount/put | new SendableLruCache()，put1条 | putCount=1 |
| 24 | testSendableLRUCacheGetPutCount002 | getPutCount/put | new SendableLruCache()，put2条 | putCount=2 |
| 25 | testSendableLRUCacheGetPutCount003 | getPutCount/put | new SendableLruCache()，put3条 | putCount=3 |
| 26 | testSendableLRUCacheGetPutCount004 | getPutCount/put | new SendableLruCache()，put3条混合类型 | putCount=3 |
| 27 | testSendableLRUCacheGetPutCount005 | getPutCount/updateCapacity/put | new SendableLruCache()，put2条后updateCapacity(2)再put1条淘汰 | 淘汰仍计入putCount=3 |

---

## 12. SendableLruCacheCreateDefault.test.ets (10用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheCreateDefault001 | createDefault/get/getCreateCount/length/contains/put | CreateDefaultLruCache(createDefault返回key+100)，put(1,10) | get(5)不存在触发createDefault返回105并加入缓存，createCount=1、length=2、contains(5)=true |
| 2 | testSendableLRUCacheCreateDefault002 | createDefault/get/getCreateCount/length/contains/put | CreateDefaultUndefinedLruCache(createDefault返回undefined)，put(1,10) | get(5)返回undefined不加入缓存，createCount=0、length=1、contains(5)=false |
| 3 | testSendableLRUCacheCreateDefault003 | createDefault/get/getCreateCount/length/put | CreateDefaultLruCache，put(1,10) | 多次get不存在key(5)(7)(9)，createCount=3、length=4，再get(5)命中createCount不增 |
| 4 | testSendableLRUCacheCreateDefault004 | createDefault/get/getCreateCount/length/put | CreateDefaultLruCache，put(1,10) | get(1)存在key不触发createDefault，createCount=0、length=1 |
| 5 | testSendableLRUCacheCreateDefault005 | createDefault/get/getRemoveCount/length/contains/updateCapacity/put | CreateDefaultLruCache，updateCapacity(2)、put(1)(2) | get(3)触发createDefault加入导致超容淘汰key1，removeCount=1、length=2、contains(1)=false、contains(3)=true |
| 6 | testSendableLRUCacheEvictOrder001 | put/contains/getRemoveCount | new SendableLruCache(2)，put(1)(2)(3) | 超容量put淘汰最久未用key1，contains(1)=false、contains(2)(3)=true、removeCount=1 |
| 7 | testSendableLRUCacheEvictOrder002 | get/put/contains | new SendableLruCache(2)，put(1)(2)后get(1)再put(3) | get(1)刷新位置使其不被淘汰，contains(1)=true、contains(2)=false、contains(3)=true |
| 8 | testSendableLRUCacheEvictOrder003 | contains/put | new SendableLruCache(2)，put(1)(2)后contains(1)再put(3) | contains(1)刷新位置使其不被淘汰，contains(1)=true、contains(2)=false、contains(3)=true |
| 9 | testSendableLRUCacheEvictOrder004 | updateCapacity/contains/getRemoveCount/put | new SendableLruCache(4)，put4条后updateCapacity(2) | 缩容按LRU顺序淘汰最久未用key1、key2，contains(1)(2)=false、contains(3)(4)=true、removeCount=2 |
| 10 | testSendableLRUCacheStress001 | put/length/getPutCount/getRemoveCount/get | new SendableLruCache(100)，循环put1000条 | 压力测试length=100、putCount=1000、removeCount=900、get(999)=1998、get(0)已淘汰 |

---

## 13. SendableLruCacheConcurrent.test.ets (33用例)

| 序号 | 名称 | API | 预置条件 | 场景 |
| --- | --- | --- | --- | --- |
| 1 | testSendableLRUCacheCombine001 | put/get/remove/contains/entries | new SendableLruCache(10)，put4条后get/remove/contains/get多操作并forceFullGC | 多API组合场景，entries()反映最终顺序arr[1]=10、arr[3]=2、arr[5]=20 |
| 2 | testSendableLRUCacheCombine002 | (类属性LruCache) | ContainsLruCache实例 | LruCache作为类属性，TestCache1/2/3均返回true |
| 3 | testSendableLRUCacheCombine003 | get/toString/put | ChildLruCache(子类重写toString)，put3条 | 子类重写toString返回"Test ChildLruCache"，get正常工作 |
| 4 | testSendableLRUCacheCombine004 | contains/put | ChildLruCache(子类重写contains抛异常)，put3条 | 子类重写contains对undefined抛'input type error'，对20返回true |
| 5 | testSendableLRUCacheWorker001 | worker | testWorkerReceiveCache001函数 | 循环10次Worker接收cache场景，每次返回true |
| 6 | testSendableLRUCacheWorker002 | worker | testWorkerReceiveCache002函数 | 循环10次Worker接收cache场景，每次返回true |
| 7 | testSendableLRUCacheWorker003 | worker | testWorkerSendCache001函数 | 循环10次Worker发送cache场景，每次返回true |
| 8 | testSendableLRUCacheTaskPool001 | taskpool | testTaskPoolCreateCacheInMainThread001函数 | 循环10次主线程创建cache传入TaskPool场景，每次返回true |
| 9 | testSendableLRUCacheTaskPool002 | taskpool | testTaskPoolCreateCacheInMainThread002函数 | 循环10次主线程创建cache传入TaskPool场景，每次返回true |
| 10 | testSendableLRUCacheTaskPool003 | taskpool | testTaskPoolCreateCacheInTaskThread001函数 | 循环10次TaskPool任务线程内创建cache场景，每次返回true |
| 11 | testSendableLRUCacheConcurrent001 | put/contains/length/AsyncLock/TaskGroup | new SendableLruCache()，AsyncLock，TaskGroup5任务concurrentPutWithLock | 并发put加锁，forceFullGC后length=5、contains(10)(20)(30)(40)(50)=true |
| 12 | testSendableLRUCacheConcurrent002 | get/getMatchCount/AsyncLock/TaskGroup | new SendableLruCache()，put(10)(20)(30)，TaskGroup3任务concurrentGetSideEffect | 并发get加锁，forceFullGC后matchCount>=3，get(10)=11、get(20)=21、get(30)=31 |
| 13 | testSendableLRUCacheTaskPoolAllApis001 | taskpool(全API) | taskPoolAllApisTest函数 | TaskPool工作线程执行所有API(除createDefault)，返回true |
| 14 | testSendableLRUCacheTaskPoolCreateDefault001 | taskpool/createDefault | CreateDefaultLruCache，taskPoolCreateDefaultTest函数 | TaskPool工作线程验证createDefault重写，返回true |
| 15 | testSendableLRUCacheConcurrentAllOpsTryCatch | taskpool/concurrent(全API) | new SendableLruCache(64)，预put10条，10轮主线程+TaskPool并发concurrentAllOpsTryCatch | 并发调用所有接口try-catch，仅断言10个任务全部完成count=10 |
| 16 | testSendableLRUCacheConcurrentWithLock | taskpool/concurrent/AsyncLock(全API) | new SendableLruCache(64)，预put10条，AsyncLock，10轮主线程+TaskPool并发concurrentAllOpsWithLock | 加锁串行化并发所有接口，断言count=10、length=10、contains(0)(9)=true |
| 17 | test_sendable_0100 | taskpool/TaskGroup(并发) | getsendablepro()(默认容量64预填1000条)，TaskGroup100任务test_sendable_0100 | 并发执行后length=66 |
| 18 | test_sendable_0200 | taskpool/TaskGroup/toString | getsendablepro()，TaskGroup100任务test_sendable_0200 | 并发后toString含'hits = 99'、length=50 |
| 19 | test_sendable_0300 | taskpool/TaskGroup(constructor异常) | getsendablepro()，TaskGroup100任务test_sendable_0300 | 并发构造传0触发异常，断言flag=true且消息含'must be small integer' |
| 20 | test_sendable_0500 | taskpool/TaskGroup/clear | getsendablepro()，TaskGroup100任务test_sendable_0500 | 并发clear后length=0 |
| 21 | test_sendable_0600 | taskpool/TaskGroup/updateCapacity/toString | getsendablepro()，TaskGroup100任务test_sendable_0600 | 并发updateCapacity后toString含'maxSize = 364' |
| 22 | test_sendable_0700 | taskpool/TaskGroup/getMissCount | getsendablepro()，TaskGroup100任务test_sendable_0700 | 并发get未命中后getMissCount=600 |
| 23 | test_sendable_0800 | taskpool/TaskGroup/getRemoveCount | getsendablepro()，TaskGroup100任务test_sendable_0800 | 并发淘汰后getRemoveCount=938 |
| 24 | test_sendable_0900 | taskpool/TaskGroup/getMatchCount | getsendablepro()，TaskGroup100任务test_sendable_0900 | 并发get命中后getMatchCount=300 |
| 25 | test_sendable_1000 | taskpool/TaskGroup/getPutCount | getsendablepro()，TaskGroup100任务test_sendable_0900 | 并发put累计getPutCount=1300 |
| 26 | test_sendable_1100 | taskpool/TaskGroup/isEmpty | getsendablepro()，TaskGroup100任务test_sendable_0900 | 并发后isEmpty=false |
| 27 | test_sendable_1200 | taskpool/TaskGroup/values | getsendablepro()，TaskGroup100任务test_sendable_1000 | 并发后values().length=64且含99 |
| 28 | test_sendable_1300 | taskpool/TaskGroup/keys | getsendablepro()，TaskGroup100任务test_sendable_1000 | 并发后keys().length=64且含99 |
| 29 | test_sendable_1400 | taskpool/TaskGroup/length | getsendablepro()，TaskGroup100任务test_sendable_1400 | 并发remove后length=63 |
| 30 | test_sendable_1500 | taskpool/TaskGroup/contains | getsendablepro()，TaskGroup100任务test_sendable_1000 | 并发后contains(99)=true |
| 31 | test_sendable_1600 | taskpool/TaskGroup/length | getsendablepro()，TaskGroup100任务test_sendable_1600 | 并发扩容后length=163 |
| 32 | SendableLruCachetestConcatArray0100 | constructor | 无 | new SendableLruCache(0)抛异常，断言e.code=401、flag=true |
| 33 | SendableLruCachetestConcatArray0200 | updateCapacity | new SendableLruCache(10)，bind updateCapacity(-5) | 调用bound updateCapacity(-5)抛异常，断言e.code=401、flag=true |
