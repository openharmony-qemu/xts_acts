# concurrent_baselib_test 套件测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_builtin_test/concurrent_baselib_test/entry/src/ohosTest/ets/test/` 下 **22** 个 `*.test.ets`（已剔除 0-it 聚合器 `List.test.ets`/`Ability.test.ets`），post-dedup 解析 **549** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移；本套件删除 30 条跨套件同名同体重复）。
> **生成日期**：2026-10-15。

---

## 0. 脑图总览（顶层结构）

```
concurrent_baselib_test（并发基础库·Buffer+容器+工具+LRU）
├── 1. 接口测试
│   ├── 1.1 Buffer / 1.2 SendableLRUCache
│   ├── 1.3~1.14 容器（List/ArrayList/HashMap/HashSet/Deque/PlainArray/LinkedList/Queue/Stack/TreeMap/TreeSet/LightWeightMap）
│   ├── 1.15~1.24 工具类（Xml/ConvertXml/Stream/Uri/Url/Timer/Process/Util/TextEncoder·Decoder/JSON）
│   └── 1.25 String 特殊字符 / 1.26 console / 1.27 AsyncLock
├── 2. 稳定性（无显式大容量/循环创建销毁压测，仅 concurrentNum 次并发）
├── 3. 性能（无计时/吞吐基准）
├── 4. 并发安全（taskpool.TaskGroup + execute 并发应力 = 全套件核心形态）
├── 5. 兼容性与继承（子类化未覆盖；跨线程引用传递由 taskpool 序列化间接覆盖）
└── 6. 资料与文档符合性（Buffer 无独立 SDK .md；@tc.desc 普遍为 "Test"）
```

> **核心形态说明**：`Buffer`/`String`/工具类/容器各用例均采用同一并发应力模板——`it('test<Method>', flags, async fn)` 内 `new taskpool.TaskGroup` → 循环 `concurrentNum` 次 `group.addTask` → `await taskpool.execute(group)` → 断言 `result.length === concurrentNum`，catch 仅 `assertFail()`。即每用例只验证"方法在 N 次并发下不崩溃且回传任务数"，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担，不在本测试目录内。

> **测试逻辑分类口径（7 类）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（本套件 22 文件 / 549 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | Buffer.test.ets | 64 | Buffer(64) |
| 2 | ConcurrentLibTest.test.ets | 116 | CBL-SendableLRUCache(12)+CBL-Collections(104) |
| 3 | DynamicXml.test.ets | 33 | CBL-Utility·Xml(33) |
| 4 | Fastbuffer.test.ets | 56 | Buffer/Fastbuffer(56,规范驻 testSubarray/toString/lastIndexOf) |
| 5 | FastbufferSecond.test.ets | 59 | Buffer/Fastbuffer(59) |
| 6 | LinkedList.test.ets | 14 | CBL-Collections(14) |
| 7 | PlainArray.test.ets | 17 | CBL-Collections(17) |
| 8 | Process.test.ets | 18 | CBL-Utility·Process(18) |
| 9 | Queue.test.ets | 9 | CBL-Collections(9) |
| 10 | SpecialChar.test.ets | 45 | Buffer(12)+String(29)+CBL-Utility·JSON(4) |
| 11 | SpecialCharSecond.test.ets | 11 | CBL-AsyncLock(2)+CBL-Utility·Xml(9) |
| 12 | Stack.test.ets | 7 | CBL-Collections(7) |
| 13 | Stream.test.ets | 12 | CBL-Utility·Stream(12) |
| 14 | StringDecoder.test.ets | 4 | CBL-Utility·StringDecoder(4) |
| 15 | Timer.test.ets | 13 | CBL-Utility·Timer(13) |
| 16 | TreeMap.test.ets | 6 | CBL-Collections(6) |
| 17 | TreeSet.test.ets | 6 | CBL-Collections(6) |
| 18 | Uri.test.ets | 11 | CBL-Utility·Uri(11) |
| 19 | Url.test.ets | 14 | CBL-Utility·URL(14) |
| 20 | Utill.test.ets | 34 | CBL-Utility·Util/TextCodec(34) |
| | **合计** | **549** | 20 文件（+2 聚合器 List.test.ets/Ability.test.ets，0 例已排除） |

---

# 1. 接口测试

> **本套件为"并发应力模板"套件**：各接口用例均采用同一模板——`new taskpool.TaskGroup` → 循环 `concurrentNum` 次 `group.addTask` → `await taskpool.execute(group)` → 断言 `result.length === concurrentNum`，catch 仅 `assertFail()`。每用例只验证"方法在 N 次并发下不崩溃且回传任务数"，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担。下列各 §1.x 树中 ❶~❸ 类（边界值/异常/返回值）多为 ❌，是模板的结构性缺口（非本套件职责），缺口详见 §7。

## 1.1 Buffer（内置）

```
Buffer
├── 入参范围覆盖
│   ├── alloc/byteLength/compare/concat/copy/equals/fill/from*/includes/indexOf/lastIndexOf/subarray 等 ~50 方法点
│   ├── read*/write*（Int8/16/32/UInt8/16/32/Float/Double/BigInt64 BE+LE）
│   └── swap16/32/64、entries/keys/values、isBuffer/isEncoding、transcode/toJSON/toString
├── 边界值测试
│   └── ❌ 无 size=0/1/极大/字节数对齐边界（固定入参）
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言 401/10200001（越界 read/write）
├── 返回值与类型验证
│   └── ❌ 仅 result.length==N，未校验 read*/write*/compare 返回值
├── 组合场景
│   ├── TaskGroup + addTask + execute 组合
│   └── emoji/escape/special 字符路径变体（SpecialChar 12 例）
├── 重复调用/幂等性
│   └── concurrentNum 次重复 addTask 同一方法
└── 并发跨线程
    └── taskpool 并发执行（核心形态）
```

- **用例位置**：`Buffer.test.ets`（64）+ `Fastbuffer.test.ets`（56，规范驻 `testSubarray`/`testToString`/`testLastIndexOf`）+ `FastbufferSecond.test.ets`（59）+ `SpecialChar.test.ets`（Buffer 部分 12，特殊字符路径）。
- **测了哪些**：~50 逻辑方法 ×（normal/emoji/escape/special 变体）的"并发不崩"应力；不测返回值正确性、越界/类型异常、容量边界（见 §7.2）。

---

## 1.2 SendableLRUCache（@arkts.utils）

```
SendableLRUCache
├── 入参范围覆盖
│   ├── put/get/remove/contains/updateCapacity/getCapacity/clear 全 API 点
│   └── keys/values/entries/isEmpty/createDefault
├── 边界值测试
│   └── ❌ 无 capacity=0/1/超容淘汰边界
├── 异常与非法输入
│   └── ❌ 未断言超容/缺参错误码
├── 返回值与类型验证
│   └── 🟡 get/remove 返回值未显式断言
├── 组合场景
│   └── put→get→contains→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发（Sendable 跨线程）
```

- **用例位置**：`ConcurrentLibTest.test.ets`（LRU 部分 12：`test_concurrent_lru_cache_put/get/remove/contains/updateCapacity/getCapacity/clear/keys/values/entries/isEmpty/createDefault`）。
- **测了哪些**：12 个 LRU API 的并发应力；不测容量淘汰顺序（LRU 语义）、capacity 边界、get 缺失键→undefined（见 §7.2）。

---

## 1.3 List（@ohos.util）

```
List
├── 入参范围覆盖
│   ├── add/insert/get/getIndexOf/remove/removeByIndex/set
│   └── clear/sort/clone/forEach/convertToArray/[Symbol.iterator]
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界/类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── add→get→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_list_insert` 等各方法）。
- **测了哪些**：List 全方法点的并发应力；不测容量边界、sort 比较器异常、clone 深拷贝独立性（见 §7.2）。

---

## 1.4 ArrayList（@ohos.util）

```
ArrayList
├── 入参范围覆盖
│   ├── add/insert/get/getIndexOf/remove/removeByIndex/set/clear
│   └── sort/clone/forEach/[Symbol.iterator]/convertToArray
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界/类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── add→get→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_arraylist_getIndexOf` 等各方法）。
- **测了哪些**：ArrayList 全方法点的并发应力；不测容量边界、越界错误码（见 §7.2）。

---

## 1.5 HashMap（@ohos.util）

```
HashMap
├── 入参范围覆盖
│   ├── set/get/hasKey/hasValue/remove/clear
│   └── keys/values/entries/forEach/[Symbol.iterator]
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── set→get→hasKey→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_hashmap_hasKey` 等各方法）。
- **测了哪些**：HashMap 全方法点的并发应力；不测容量边界、类型错误码（见 §7.2）。

---

## 1.6 HashSet（@ohos.util）

```
HashSet
├── 入参范围覆盖
│   ├── add/has/remove/clear
│   └── forEach/[Symbol.iterator]/convertToArray
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言类型错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── add→has→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_hashset_remove` 等各方法）。
- **测了哪些**：HashSet 全方法点的并发应力；不测容量边界、类型错误码（见 §7.2）。

---

## 1.7 Deque（@ohos.util）

```
Deque
├── 入参范围覆盖
│   ├── insertFront/insertLast/deleteFront/deleteLast
│   └── getFront/getLast/has/forEach
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── insert→get→delete 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_deque_*` 各方法）。
- **测了哪些**：Deque 全方法点的并发应力；不测容量边界、越界错误码（见 §7.2）。

---

## 1.8 PlainArray（@ohos.util）

```
PlainArray
├── 入参范围覆盖
│   ├── constructor/has/get/getIndexOfKey/getKeyAt
│   ├── add/remove/removeRangeFrom/removeAt/clear
│   └── clone/forEach/[Symbol.iterator]/getValueAt/setValueAt
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── add→has→get→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`PlainArray.test.ets`（17：`testPlainArrayConstructor/Has/GetIndexOfKey/GetKeyAt/Clone/Remove/RemoveRangeFrom/Clear` 等）。
- **测了哪些**：PlainArray 全方法点的并发应力；不测容量边界、越界错误码（见 §7.2）。

---

## 1.9 LinkedList（@ohos.util）

```
LinkedList
├── 入参范围覆盖
│   ├── add/addFirst/insert/has/get/getIndexOf/getLastIndexOf
│   └── removeFirstFound/remove/removeByIndex/clear/clone/forEach
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── addFirst→getFirst→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`LinkedList.test.ets`（14：`testLinkedListAdd/AddFirst/Insert/Has/Get/GetIndexOf/GetLastIndexOf/RemoveFirstFound` 等）。
- **测了哪些**：LinkedList 全方法点的并发应力；不测容量边界、越界错误码（见 §7.2）。

---

## 1.10 Queue（@ohos.util）

```
Queue
├── 入参范围覆盖
│   ├── add(number/string/undefined)（0100/0200/0300）
│   ├── pop（0400）/ pop 空容器（0600）
│   └── getFirst/getFirstEmpty/forEach（0700~1000）
├── 边界值测试
│   └── pop 空容器、getFirst 空容器（0600/0900）
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言错误码
├── 返回值与类型验证
│   └── 🟡 pop/getFirst 返回值未显式断言
├── 组合场景
│   └── add→pop→getFirst 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Queue.test.ets`（9：`testQueueAddNumber/AddString/AddUndefined/Pop/PopEmpty/GetFirst/GetFirstEmpty/ForEach` 等）。
- **测了哪些**：Queue 全方法点的并发应力；含 pop 空容器边界场景（0600）；不测错误码（见 §7.2）。

---

## 1.11 Stack（@ohos.util）

```
Stack
├── 入参范围覆盖
│   ├── push（number）push/pop（0100/0200）
│   └── peek/locateTo/forEach/convertToArray/clear
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言错误码
├── 返回值与类型验证
│   └── 🟡 push/pop 返回值未显式断言
├── 组合场景
│   └── push→pop→peek 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Stack.test.ets`（7：`testStackPush0001`/`testStackpop0002` 等）。
- **测了哪些**：Stack 全方法点的并发应力；不测容量边界、错误码（见 §7.2）。

---

## 1.12 TreeMap（@ohos.util）

```
TreeMap
├── 入参范围覆盖
│   ├── set/get/getFirstKey/getLastKey/hasKey/remove
│   └── forEach/clear/keys/values/[Symbol.iterator]
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言 comparator 错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── set→get→hasKey→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`TreeMap.test.ets`（6）。
- **测了哪些**：TreeMap 全方法点的并发应力；不测 comparator 一致性、容量边界、错误码（见 §7.2）。

---

## 1.13 TreeSet（@ohos.util）

```
TreeSet
├── 入参范围覆盖
│   ├── add/has/remove/getFirstValue/getLastValue
│   └── forEach/clear/[Symbol.iterator]
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言 comparator 错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── add→has→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`TreeSet.test.ets`（6）。
- **测了哪些**：TreeSet 全方法点的并发应力；不测 comparator 一致性、容量边界、错误码（见 §7.2）。

---

## 1.14 LightWeightMap（@ohos.util）

```
LightWeightMap
├── 入参范围覆盖
│   ├── set/get/hasKey/hasValue/remove/increaseCapacityTo
│   └── forEach/clear/[Symbol.iterator]/keys/values
├── 边界值测试
│   └── ❌ 无空容器/单元素/超大规模边界
├── 异常与非法输入
│   └── ❌ 未断言越界错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── set→get→hasValue→remove 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_lightweightmap_hasValue` 等各方法）。
- **测了哪些**：LightWeightMap 全方法点的并发应力；不测容量边界、越界错误码（见 §7.2）。

---

## 1.15 Xml（@ohos.xml）

```
Xml
├── 入参范围覆盖
│   ├── XmlSerializer set*（setDeclaration/setAttributes/setStartElement/setText/setComment/setCDATA/addEmptyElement）
│   ├── XmlPullParser parse（getColumnNumber/getPrefix/ignoreNameSpace）
│   └── constructor
├── 边界值测试
│   └── ❌ 无空 XML/超长/嵌套边界
├── 异常与非法输入
│   └── ❌ 未断言非法 XML 抛错
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   ├── 序列化→解析链（round-trip）
│   └── 特殊字符 XML 路径（SpecialCharSecond 9 例）
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`DynamicXml.test.ets`（33：`testXmlDynamicSerializer/setDeclaration/XmlSerializerConstructor/StartElement/SetText2/ParseInfo_getColumnNumber/ParseOptions_ignoreNameSpace/ParseInfo_getPrefix` 等）+ `SpecialCharSecond.test.ets`（Xml 9：`testXmlSerializerConstructorSpecial/setAttributesSpecial/addEmptyElementSpecial/startElementSpecial/setCommentSpecial/setCDATASpecial`）。
- **测了哪些**：XmlSerializer/PullParser 全 API 点的并发应力 + 特殊字符路径；不测非法 XML 抛错、round-trip 内容一致性（见 §7.2）。

---

## 1.16 ConvertXml（@ohos.xml）

```
ConvertXml
├── 入参范围覆盖
│   └── convertToJSObject（XML→JS 对象转换）
├── 边界值测试
│   └── ❌ 无空 XML/嵌套边界
├── 异常与非法输入
│   └── ❌ 未断言非法 XML 抛错
├── 返回值与类型验证
│   └── 🟡 返回对象未显式断言
├── 组合场景
│   └── XML 输入→convertToJSObject 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_convertxml_convertToJSObject`）。
- **测了哪些**：convertToJSObject 的并发应力；不测非法 XML 抛错、转换结果正确性（见 §7.2）。

---

## 1.17 Stream（@ohos.stream）

```
Stream
├── 入参范围覆盖
│   └── writable/read/pause/on/unpipe/pipe 等流控制 API
├── 边界值测试
│   └── ❌ 无空流/超长边界
├── 异常与非法输入
│   └── ❌ 未断言流错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── pipe 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Stream.test.ets`（12）。
- **测了哪些**：流控制 API 的并发应力；不测流错误码、边界（见 §7.2）。

---

## 1.18 Uri（@ohos.uri）

```
Uri
├── 入参范围覆盖
│   ├── constructor（parse URI 字符串）
│   └── scheme/host/port/path/query/fragment/equals/normalizeUri
├── 边界值测试
│   └── ❌ 无空 URI/超长/嵌套边界
├── 异常与非法输入
│   └── ❌ 未断言非法 URI 抛错
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── parse→各属性读取链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Uri.test.ets`（11）。
- **测了哪些**：Uri 解析/属性 API 的并发应力；不测非法 URI 抛错、边界（见 §7.2）。

---

## 1.19 URL / URLParams（@ohos.url）

```
URL
├── 入参范围覆盖
│   ├── constructor（parse URL 字符串）
│   ├── scheme/host/port/path/query/fragment/toString
│   └── URLParams 全方法（set/get/has/append/delete/sort/entries/forEach）
├── 边界值测试
│   └── ❌ 无空 URL/超长边界
├── 异常与非法输入
│   └── ❌ 未断言非法 URL 抛错
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── parse→URLParams set→get 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Url.test.ets`（14）。
- **测了哪些**：URL/URLParams 全方法点的并发应力；不测非法 URL 抛错、边界（见 §7.2）。

---

## 1.20 Timer（@ohos.timer）

```
Timer
├── 入参范围覆盖
│   └── setInterval/setTimeout/clearInterval/clearTimeout 包装
├── 边界值测试
│   └── ❌ 无 delay 边界（固定入参）
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回 timer ID 未显式断言
├── 组合场景
│   └── set→clear 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Timer.test.ets`（13）。
- **测了哪些**：timer 包装 API 的并发应力；不测 delay 边界、错误码（见 §7.2）。

---

## 1.21 Process（@ohos.process）

```
Process
├── 入参范围覆盖
│   ├── uid/pid/tid/is64Bit/getPastCpuTime/getUidForName
│   └── ProcessManager getThreadPriority/getSystemConfig/exit
├── 边界值测试
│   └── ❌ 无极值/越界边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── uid→getUidForName→getThreadPriority 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Process.test.ets`（18：`testProcessUid/Tid/is64Bit/GetPastCpuTime/GetUidForName/ProcessManagerGetThreadPriority/GetSystemConfig/Exit` 等）。
- **测了哪些**：process API 点的并发应力；不测 Process.exit 终止语义、错误码（见 §7.2）。

---

## 1.22 Util（@ohos.util）

```
Util
├── 入参范围覆盖
│   ├── format/uuid/hash/promisify
│   └── TextEncoder encode/encodeInto、TextDecoder decode、randomUUID/base64
├── 边界值测试
│   └── ❌ 无空输入/超长边界
├── 异常与非法输入
│   └── ❌ 未断言编码错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── format→encode→decode 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`Utill.test.ets`（34：util + TextCodec API 点）。
- **测了哪些**：util/TextCodec API 点的并发应力；不测编码不支持的 charset、错误码（见 §7.2）。

---

## 1.23 TextEncoder / TextDecoder（@ohos.util）

```
TextEncoder / TextDecoder
├── 入参范围覆盖
│   ├── TextEncoder encode/encodeInto
│   └── TextDecoder decode（encoding/utf-8）
├── 边界值测试
│   └── ❌ 无空输入/超长/代理对边界
├── 异常与非法输入
│   └── ❌ 未断言不支持的 charset 错误码
├── 返回值与类型验证
│   └── 🟡 返回 Uint8Array/string 未显式断言
├── 组合场景
│   └── encode→decode round-trip 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`StringDecoder.test.ets`（4：TextDecoder/encode API 点）+ `Utill.test.ets`（TextCodec 部分）。
- **测了哪些**：encode/decode API 点的并发应力；不测不支持的 charset、代理对边界（见 §7.2）。

---

## 1.24 JSON（内置）

```
JSON
├── 入参范围覆盖
│   └── parse/stringify
├── 边界值测试
│   └── ❌ 无空串/超长/嵌套边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail，未断言非法 JSON 抛错
├── 返回值与类型验证
│   └── 🟡 返回对象/串未显式断言
├── 组合场景
│   └── stringify→parse round-trip 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`SpecialChar.test.ets`（JSON 部分 4）。
- **测了哪些**：parse/stringify 的并发应力（特殊字符路径）；不测非法 JSON 抛错、边界（见 §7.2）。

---

## 1.25 String 特殊字符路径（跨特性归位）

```
String 特殊字符变体
├── 入参范围覆盖
│   ├── BuilintsStringPrototype*Special 全方法（CharCodeAt/IndexOf/PadStart/StartsWith/ToString/...）
│   └── Constructor/LastIndexOf/Match/Raw Special
├── 边界值测试
│   └── ❌ 无空串/代理对边界
├── 异常与非法输入
│   └── ❌ catch 仅 assertFail
├── 返回值与类型验证
│   └── ❌ 仅 result.length==N，未校验返回串
├── 组合场景
│   └── TaskGroup + execute
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`SpecialChar.test.ets`（String 部分 29：`BuilintsStringPrototype*Special` 全方法特殊字符路径）。
- **测了哪些**：33 原型方法 + 29 特殊字符变体的并发应力；不测返回串正确性、空串/代理对边界（见 §7.2）。

---

## 1.26 console（内置）

```
console
├── 入参范围覆盖
│   └── log/info/warn/error/debug/trace
├── 边界值测试
│   └── ❌ 无空参/超长参边界
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回 void 未显式断言
├── 组合场景
│   └── format 字符串 + 多参组合
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`ConcurrentLibTest.test.ets`（`test_concurrent_console_debug` 等）。
- **测了哪些**：console 各日志方法的并发应力；不测 format 边界、错误码（见 §7.2）。

---

## 1.27 AsyncLock（@arkts.utils）

```
AsyncLock
├── 入参范围覆盖
│   └── request/query（异步锁请求/查询）
├── 边界值测试
│   └── ❌ 无边界场景
├── 异常与非法输入
│   └── ❌ 未断言错误码
├── 返回值与类型验证
│   └── 🟡 返回值未显式断言
├── 组合场景
│   └── request→query→release 链
├── 重复调用/幂等性
│   └── concurrentNum 次
└── 并发跨线程
    └── taskpool 并发
```

- **用例位置**：`SpecialCharSecond.test.ets`（AsyncLock 部分 2：`testAsyncLockRequestSpecial/QuerySpecial`）。
- **测了哪些**：AsyncLock request/query 的并发应力（特殊字符路径）；不测锁边界、错误码（见 §7.2）。

---

# 2. 稳定性
- **用例位置**：无（所有用例仅 `concurrentNum` 次瞬时执行）。
- **测了哪些**：❌ 未覆盖。无大容量、无循环创建销毁、无长时运行压测；所有用例仅 `concurrentNum` 次瞬时执行（见 §7.4 #1）。

# 3. 性能
- **用例位置**：无（仅断言任务数）。
- **测了哪些**：❌ 未覆盖。无计时、无吞吐基准、无延迟统计；仅断言 `result.length === concurrentNum`（见 §7.4 #1）。

# 4. 并发安全
- **用例位置**：全套件 549 用例均以 `taskpool.TaskGroup + execute` 为并发载体（核心形态）。
- **测了哪些**：🟡 部分覆盖（核心形态但深度不足）。builtin 在并发执行下不崩溃；✅ 任务数回传正确（`result.length === concurrentNum`）；❌ 未校验跨线程数据可见性/Sendable 跨线程引用传递语义/并发错误码/并发量边界（1/极大/0 任务）（见 §7.3）。

# 5. 兼容性与继承
- **用例位置**：无。
- **测了哪些**：❌ 基本未覆盖。无 Buffer 子类化、无自定义容器子类；跨线程引用传递由 taskpool 序列化间接覆盖（无显式断言）。

# 6. 资料与文档符合性
- **用例位置**：`grep` 确认 `apis-arkts/` 无 `arkts-apis-arkts-collections-Buffer.md`；`@tc.desc` 普遍为 "Test"（仅 SendableLRUCache 12 条有语义 desc）。
- **测了哪些**：⚠️ 文档缺口显著：`Buffer`/`FastBuffer` 无独立 SDK `.md`（`@arkts.collections.d.ets` 未声明 Buffer）；`@tc.desc` 普遍为 "Test"（无信息量，可追溯性差，见 §7.4 #2）。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| Buffer 内置 | ❌(固定入参) | ❌(无 size 边界) | ❌(catch assertFail) | ❌(仅 length==N) | ✅(TaskGroup) | ✅(concurrentNum) | ✅(taskpool) |
| SendableLRUCache | 🟡(12 API 点) | ❌(无容量边界) | ❌(无错误码) | 🟡(未显式断言) | ✅(put→get→remove) | ✅ | ✅(Sendable 跨线程) |
| 容器集合 | 🟡(全方法点) | ❌(无空/大规模) | ❌(无错误码) | 🟡(未显式断言) | ✅(add→get→remove) | ✅ | ✅(taskpool) |
| 工具类 | 🟡(主 API 点) | ❌(无空/超长) | ❌(无解析错误码) | 🟡(未显式断言) | ✅(序列化→解析) | ✅ | ✅(taskpool) |
| String 特殊字符 | 🟡(29 变体) | ❌(无空串/代理对) | ❌(catch assertFail) | ❌(仅 length==N) | ✅(TaskGroup) | ✅ | ✅(taskpool) |

## 7.2 逐接口遗漏确认（对照 `@arkts.collections.d.ets` / `@ohos.util` 等）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。结论经实际测试代码逐行复核。本套件为"并发应力模板"套件，功能正确性由 `testability/pages/*` 私有库承担，不在本测试目录内。

| # | 接口 | 契约要点 | 核查结论 |
|---|------|--------------------------|----------|
| 1 | Buffer 内置（alloc/byteLength/compare/concat/...） | 全局内置，无 .d.ets 声明 | 🟡 仅"并发不崩"应力。❌ **入参范围**（alloc 的 size/encoding 空间未遍历）、❌ **边界值**（size=0/1/极大/字节数对齐）、❌ **异常码**（越界 read/write→401/10200001 未断言，catch 仅 assertFail）、❌ **返回值**（read*/write*/compare 返回值未校验）。缺口由 testability 私有库承担（见 §7.4 #1）。 |
| 2 | SendableLRUCache（put/get/remove/contains/...） | @arkts.utils，容量淘汰 | 🟡 12 API 点并发应力。❌ **容量淘汰顺序**（LRU 语义未测）、❌ **capacity=0/1 边界**、❌ **get 缺失键→undefined**、❌ **超容/缺参错误码**。 |
| 3 | 容器集合（List/HashMap/.../TreeMap） | @ohos.util，各容器全方法 | 🟡 全方法点并发应力。❌ **空容器/单元素/超大规模边界**、❌ **越界/类型错误码**、❌ **sort 比较器异常**、❌ **TreeMap comparator 一致性**、❌ **clone 深拷贝独立性**。 |
| 4 | 工具类（Xml/Uri/Url/Timer/Process/Util/...） | @ohos.util/@ohos.uri 等 | 🟡 主 API 点并发应力。❌ **Xml 非法 XML 抛错**、❌ **URL 非法 URL 抛错**、❌ **编码不支持的 charset**、❌ **Process.exit 终止语义**。 |
| 5 | String 特殊字符变体（29 BuilintsStringPrototype*Special） | 全局内置 String 原型 | 🟡 29 变体并发应力。❌ **返回串正确性**、❌ **空串/代理对边界**、❌ **replaceAll/matchAll 回调异常**。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **"并发不崩"覆盖深度不足**：全套件 549 用例均以 `taskpool.TaskGroup + execute` 为载体，仅验证"方法在 N 次并发下不崩溃且回传任务数"。❌ 未校验跨线程数据可见性、Sendable 跨线程引用传递语义、并发错误码、并发量边界（1/极大/0 任务）。这是全套件的结构性缺口（功能正确性由 testability 私有库承担，但并发深度断言缺失）。
2. **SendableLRUCache 并发读写一致性**：put/get/remove 在多线程并发下数据一致性（LRU 淘汰顺序、get 命中正确性）未断言，仅"不崩"。❌ 组合缺口（SUP_BASELIB_LRU_CONC_CONSISTENCY_001）。
3. **容器并发写写**：List/HashMap 等多线程并发 add/remove 的数据一致性（最终 size/内容正确性）未断言。❌ 组合缺口（SUP_BASELIB_COLLECTION_CONC_CONSISTENCY_001）。
4. **Xml 序列化→解析闭环**：`DynamicXml` 覆盖 XmlSerializer/PullParser API 点，但序列化→解析的内容闭环（round-trip 一致性）未断言，仅"不崩"。⚠️ 部分缺口。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **"并发不崩"模板定位**：本套件为"并发应力模板"套件，功能正确性/边界/异常/返回值由 `testability/pages/*` 私有库承担，不在本测试目录内。建议资料侧在套件说明注明该定位，避免误解为功能覆盖套件；测试侧保留并发应力定位，功能缺口由 testability 私有库覆盖。
2. **Buffer 无独立 `.md`（⚠️ 文档缺口）**：`Buffer`/`FastBuffer` 为全局内置（`@arkts.collections.d.ets` 未声明），`apis-arkts/` 无 `arkts-apis-arkts-collections-Buffer.md`。建议资料侧补 Buffer `.md`（或注明"全局内置无独立 SDK 声明"）。
3. **@tc.desc 占位 "Test"（⚠️）**：`@tc.desc` 普遍为 "Test"（无信息量，可追溯性差），仅 SendableLRUCache 12 条有语义 desc。建议补语义化 desc（标注方法名/场景），与 SendableLRUCache 段对齐。
4. **SendableLRUCache 错误码声明**：`@arkts.utils` SendableLRUCache 声明，但超容/缺参错误码未声明且未测。建议资料侧补 `@throws` 说明（若契约），测试侧补错误码用例（SUP_BASELIB_LRU_ERR_001）。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P1** | 2 | SUP_BASELIB_LRU_CONC_CONSISTENCY_001、SUP_BASELIB_COLLECTION_CONC_CONSISTENCY_001 | SendableLRUCache/容器并发写写数据一致性；现有套件"不崩即通过"掩盖真实数据损坏，最高优先。 |
| **P2** | 2 | SUP_BASELIB_LRU_ERR_001、@tc.desc 占位补语义化 | SendableLRUCache 错误码 / desc 信息密度提升；非阻断但提升套件质量。 |
| — | — | Buffer/容器/工具类/String 功能正确性 | 结构性缺口，由 testability 私有库承担，本套件不补。 |
| **合计** | **4 新增** | | P1=2 / P2=2。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 模板用固定入参，未遍历各方法的入参空间（size/encoding/容器元素类型/Xml 输入等）；仅"全方法点"覆盖 | Buffer.test 64 方法点固定入参、ConcurrentLibTest 容器全方法点 |
| ②边界值测试 | 无 size=0/1/极大/字节数对齐、无空容器/单元素/超大规模、无空输入/超长/嵌套 | （本套件无边界用例，结构性缺口） |
| ③异常与非法输入 | catch 仅 assertFail，未断言 401/10200001/越界 RangeError/解析失败/编码错误/非法 URL | （本套件无异常码断言，结构性缺口） |
| ④返回值与类型验证 | 仅断言 `result.length === concurrentNum`，未校验 read*/write*/compare/get/remove 等返回值 | Buffer/ConcurrentLibTest 仅 length==N |
| ⑤组合场景 | TaskGroup + addTask + execute 组合、put→get→contains→remove 链、add→get→remove 链、序列化→解析链 | ConcurrentLibTest LRU/容器链、DynamicXml 序列化→解析 |
| ⑥重复调用幂等性 | concurrentNum 次重复 addTask 同一方法（模板固有） | 全套件 concurrentNum 次重复 |
| ⑦并发跨线程 | taskpool.TaskGroup + execute 并发执行（核心形态），worker 池调度 + 跨线程结果回传 | 全套件 549 用例核心形态 |
