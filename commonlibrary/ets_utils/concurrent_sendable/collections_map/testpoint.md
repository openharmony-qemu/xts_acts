# collections.Map 测试点报告（按接口维度·摘要版）

> **数据来源**：`test/xts/acts/commonlibrary/ets_utils/concurrent_sendable/collections_map/entry/src/ohosTest/ets/test/` 下 30 个 `*.test.ets`，共解析 **1158** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐，零漂移）。
> **契约来源**：`interface/sdk-js/arkts/@arkts.collections.d.ets` **L1072–L1315**（`class Map<K, V>`）。
> **文档来源**：`docs/zh-cn/application-dev/reference/apis-arkts/arkts-apis-arkts-collections-Map.md`（仓库内同名列文件 `test/.../apis-arkts/arkts-apis-arkts-collections-Map.md`）。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
collections.Map
├── 1. 接口测试
│   ├── constructor           （entries 数组 | Iterable | null | 子类 super）
│   ├── size (readonly)       （只读属性，随增删改变化）
│   ├── set(key, value)       （新增/更新，返回 Map 链式）
│   ├── get(key)              （取值，缺失返回 undefined）
│   ├── has(key)             （存在性，SameValueZero）
│   ├── delete(key)          （删除返回 boolean）
│   ├── clear()             （清空，size→0）
│   ├── keys() / values() / entries()   （IterableIterator，插入序）
│   ├── forEach(callback)    （遍历，value/key/map 三参）
│   ├── put / putAll / remove / containsValue   （@since 26.0.1 新 API 组）
│   ├── [Symbol.iterator]()   （声明注明 .ets 不可直接调用，间接覆盖）
│   └── capacity/expand（内部扩容边界 1024，行为维度）
├── 2. 稳定性                  （1000/10250/500000 大容量、循环创建销毁）
├── 3. 性能                    （10000 次 forEach、大 Map 读取）
├── 4. 并发安全                 （TaskPool/Worker/AsyncLock/CV/多写者竞态）
├── 5. 兼容性与继承            （子类化、@Sendable 继承、跨线程引用传递）
└── 6. 资料与文档符合性         （@Sendable 装饰、import、泛型 Sendable 约束）
```

**测试逻辑分类口径（7 类，贯穿全部接口树）**：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | CollectionsMapConstructorTest.test.ets | 19 | constructor（基础类型/边界/异常） |
| 2 | CollectionsMapConstructorTest01.test.ets | 72 | constructor（entries×iterable 全类型矩阵） |
| 3 | CollectionsMapSetGet.test.ets | 75 | set / get（全类型存取配对） |
| 4 | CollectionsMapGetTest.test.ets | 41 | get |
| 5 | CollectionsMapHasTest.test.ets | 36 | has |
| 6 | CollectionsMapHasDelete.test.ets | 72 | has / delete（全类型配对） |
| 7 | CollectionsMapDeleteTest.test.ets | 53 | delete |
| 8 | CollectionsMapClearTest.test.ets | 45 | clear |
| 9 | CollectionsMapClearSize.test.ets | 72 | clear / size（全类型配对） |
| 10 | CollectionsMapKeysValues.test.ets | 73 | keys / values（全类型配对） |
| 11 | CollectionsMapValuesTest.test.ets | 47 | values |
| 12 | CollectionsMapEntriesTest.test.ets | 31 | entries |
| 13 | CollectionsMapEntriesOrderTest.test.ets | 2 | entries 迭代序（@@iterator 与 entries() 一致性、delete+re-add 后重排至末尾） |
| 14 | CollectionsMapForeachTest.test.ets | 42 | forEach |
| 15 | CollectionsMapForEachEntries.test.ets | 72 | forEach / entries（全类型配对） |
| 16 | CollectionsMapThisArgTest.test.ets | 3 | forEach thisArg 上下文绑定 |
| 17 | CollectionsMapPutTest.test.ets | 18 | put |
| 18 | CollectionsMapRemoveTest.test.ets | 18 | remove |
| 19 | CollectionsMapContainsValueTest.test.ets | 19 | containsValue |
| 20 | CollectionsMapPutAllSendableTest.test.ets | 13 | putAll(Map 源) |
| 21 | CollectionsMapPutAllBuiltinTest.test.ets | 10 | putAll(ReadonlyMap 源) |
| 22 | CollectionsMapNewApiTypeTest.test.ets | 48 | put/containsValue/putAll/remove 新 API 全类型矩阵 |
| 23 | CollectionsMapNonOrthogonal.test.ets | 35 | 非正交/装饰器/继承/异常码全量 |
| 24 | CollectionsMapExpand1024Test.test.ets | 19 | capacity/expand（1024 边界） |
| 25 | MapBasic.test.ets | 31 | basic（全接口基本 smoke） |
| 26 | Normal/MapNormal.test.ets | 60 | basic（normal 综合场景） |
| 27 | Concurrent/MapConcurrent.test.ets | 19 | concurrency（Map+Set 并发 smoke） |
| 28 | TaskPool/MapTaskPool.test.ets | 60 | concurrency（Normal 同场景跨 TaskPool） |
| 29 | CollectionsMapConcurrent.test.ets | 25 | concurrency（深度并发/稳定性/性能） |
| 30 | collections/MapInheritanceTest.test.ets | 28 | inheritance（子类化/继承链） |
| | **合计** | **1158** | 17 接口 + 扩容行为 |

**已排除**：`List.test.ets`（聚合 re-export，0 条 `@tc.name`）、`Util.test.ets`（工具类 `Utils.msSleep`，0 条用例，且非 Map 用例）。两者不产出测试点。

---

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/并发/继承文件」标注用例位置；编号段取自解析结果。

## 1.1 constructor

```
constructor
├── 入参范围覆盖
│   ├── entries 数组
│   ├── Iterable 对象
│   ├── null
│   ├── undefined
│   ├── 空数组
│   └── 全类型键值矩阵：number(普通/科学记数/MAX_SAFE/NaN)、string(普通/特殊字符/emoji/空串)、
│       boolean、undefined、null、Sendable 对象/空对象、ComplexIndexSignature、collections.Array/空/sparese、
│       SendableNormalFn/ArrowFn/AsyncFn/AddFn、SendableClassBasic/Complex/Extended、const enum、
│       AsyncLock、ConditionVariable、SendableLruCache、嵌套 Map/Set/Array、large object/array、深嵌套、循环引用
├── 边界值测试
│   ├── 空 Map
│   ├── 单元素
│   ├── 1000/10250 元素
│   └── 1023/1024/1025 扩容边界
├── 异常与非法输入
│   └── 参数类型非法→401；构造失败→10200012；非 Sendable 泛型→编译/运行错误
├── 返回值与类型验证
│   ├── instanceof collections.Map
│   ├── 空构造 size=0
│   └── 元素正确写入
├── 组合场景
│   ├── 从另一 Map 构造
│   ├── 子类 super 传参
│   └── 重复键去重
├── 重复调用幂等性
│   └── 相同 entries 多次构造结果一致
└── 并发跨线程
    ├── 子类构造体跨 TaskPool
    └── Worker 接收 Map 构造
```
- **用例位置**：专用 `CollectionsMapConstructorTest.test.ets`（19 例：`CONSTRUCTOR_TEST_0100~1900`）+ `CollectionsMapConstructorTest01.test.ets`（72 例：`CONSTRUCTOR_0100~7200`）；综合套件 `MapBasic`（4 例 `0001~0004`）+ `NonOrthogonal`（8 例 `0100~0300/2200~3400`）+ 继承套件 `MapInheritance`（5 例 `0800~1100/2800`）。
- **测了哪些**：两种构造重载（entries 数组 vs Iterable）×36 种键值类型全矩阵 + 边界 + 401/10200012 异常 + instanceof。

## 1.2 size（readonly 属性）

```
size
├── 入参范围覆盖
│   └── 随 number/string/boolean/null/undefined/Sendable 等全类型键的增删变化
├── 边界值测试
│   ├── 空 Map size=0
│   ├── 单元素
│   ├── 1000/10250/500000 大容量
│   └── 1024 扩容前后
├── 异常与非法输入
│   └── （无直接异常用例，依赖宿主方法）
├── 返回值与类型验证
│   ├── number 类型
│   ├── 增删后正确衰减/递增
│   └── clear 后归零
├── 组合场景
│   ├── put→delete→clear 链中持续校验 size
│   └── forEach 次数==size
├── 重复调用幂等性
│   ├── 重复 put 同键 size 不变
│   └── 重复 delete 不再衰减
└── 并发跨线程
    ├── TaskPool 多写者下 size 一致性
    └── 子类 size 继承正确
```
- **用例位置**：无独立 `SizeTest` 文件；size 半数来自 `CollectionsMapClearSize.test.ets`（35 例：偶数段 `0200/0400/.../7000`）+ 散落 size 断言 `DeleteTest`（4 例）、`RemoveTest`（3 例）、`ClearTest`（3 例）、`Normal`/`TaskPool`（各 9 例 `0051~0059`）、`Concurrent`（2 例 `0010`）、`Inheritance`（2 例 `0600/2200`）。
- **测了哪些**：size 随各类键增删的正确性、大容量/扩容边界、并发一致性；**未见 size 单独异常用例**（size 为只读属性，无独立抛错契约）。

## 1.3 set(key, value)

```
set
├── 入参范围覆盖
│   └── 36 种键值类型存入（同 constructor 矩阵）
├── 边界值测试
│   ├── 空 Map first set
│   ├── 1023/1024/1025 跨边界
│   └── 大对象/大数组 value
├── 异常与非法输入
│   └── （set 自身 bind 异常见 NonOrthogonal 间接）
├── 返回值与类型验证
│   ├── 返回 Map 实例可链式
│   └── 存后 get 命中
├── 组合场景
│   ├── set→delete→clear
│   ├── set 覆盖旧值
│   └── set 后 has/get 一致
├── 重复调用幂等性
│   ├── 同键多次 set 保留最后值
│   └── size 不膨胀
└── 并发跨线程
    ├── AsyncLock 保护并发 set
    └── TaskPool/Worker 跨线程 set
```
- **用例位置**：set 半数来自 `CollectionsMapSetGet.test.ets`（36 例：奇数段 `0100/0300/.../7100`）+ `NonOrthogonal`（2 例 `0600~0700` 链式返回）+ 综合套件 `Normal`/`TaskPool`（各 21 例）、`Concurrent`（10 例 `0006`）+ 继承 `Inheritance`（3 例 `0300/2000/2100`）。
- **测了哪些**：全类型存入 + 链式返回 + 覆盖语义 + 跨线程并发写。

## 1.4 get(key)

```
get
├── 入参范围覆盖
│   └── number/string/boolean/null/undefined/NaN/Sendable 实例/BigInt/Unicode/超长串 键取值
├── 边界值测试
│   ├── 空 Map
│   ├── 单元素
│   ├── 1000/10250/大 Map
│   └── 缺失键
├── 异常与非法输入
│   └── detached 方法→10200011（get 同 bind 契约）
├── 返回值与类型验证
│   ├── 命中返回值
│   ├── 缺失返回 undefined
│   ├── 能区分 null/undefined 键
│   └── BigInt≠Number
├── 组合场景
│   ├── set→get
│   ├── delete 后 get→undefined
│   ├── clear 后 get→undefined
│   └── copy 后 get
├── 重复调用幂等性
│   ├── 同键多次 get 一致
│   └── 同键多次 set 后 get 取最新
└── 并发跨线程
    ├── 跨 TaskPool 传递后 get
    └── Worker 接收后 get
```
- **用例位置**：专用 `CollectionsMapGetTest.test.ets`（39 例：`GET_TEST_0100~3900`）+ get 半数 `CollectionsMapSetGet.test.ets`（36 例：偶数段 `0200/.../7200`）+ 综合套件 `Normal`/`TaskPool`（各 19 例 `0015~0059`）+ `NonOrthogonal`（2 例 `0800~0900`）+ `Concurrent`（1 例 `0004`）。
- **测了哪些**：全类型键取值 + undefined 语义 + SameValueZero(NaN/+0/-0) + 跨线程取值一致性。

## 1.5 has(key)

```
has
├── 入参范围覆盖
│   └── number/string/boolean/null/undefined/Infinity/-Infinity/BigInt/Unicode/超长串/多行串/Sendable 实例 键
├── 边界值测试
│   ├── 空 Map→false
│   ├── 单元素
│   ├── 大数量键
│   └── 性能版（大数量键）
├── 异常与非法输入
│   └── detached→10200011（同 bind 契约，间接）
├── 返回值与类型验证
│   ├── true/false boolean
│   ├── SameValueZero(NaN)
│   ├── +0≠-0 区分
│   └── null≠undefined
├── 组合场景
│   ├── set 后 has→true
│   ├── delete/clear 后 has→false
│   └── 重加后 has→true
├── 重复调用幂等性
│   ├── 同键多次 has 一致
│   └── 变量重赋值后仍命中
└── 并发跨线程
    ├── 跨线程引用 has
    └── 子类继承 has
```
- **用例位置**：专用 `CollectionsMapHasTest.test.ets`（34 例：`HAS_TEST_0100~3400`）+ has 半数 `CollectionsMapHasDelete.test.ets`（36 例：奇数段 `0100/0300/.../7100`）+ 综合套件 `Normal`/`TaskPool`（各 11 例 `0015~0050`）+ `ValuesTest`（4 例 `0290~0410`，一致性比对）+ `Concurrent`（2 例 `0005`）+ 继承 `Inheritance`（3 例 `0300/1600/2800`）。
- **测了哪些**：全类型存在性 + SameValueZero 边界 + 增删后一致性 + 大数量性能。

## 1.6 delete(key)

```
delete
├── 入参范围覆盖
│   └── number/string/boolean/null/undefined/NaN/Infinity/BigInt/class 实例 键删除
├── 边界值测试
│   ├── 空 Map 删→false
│   ├── 单元素
│   ├── 首/末元素
│   ├── 1000/大 Map
│   └── 删全后空
├── 异常与非法输入
│   ├── forEach 内 delete→10200201 并发修改
│   └── detached→10200011
├── 返回值与类型验证
│   ├── boolean（存在 true / 不存在 false）
│   └── 不影响其余键
├── 组合场景
│   ├── delete→has/get 联动
│   ├── delete→clear
│   ├── delete→重加
│   └── set 覆盖后 delete
├── 重复调用幂等性
│   ├── delete 两次第二次 false
│   ├── 循环删除
│   └── clear 后 delete→false
└── 并发跨线程
    ├── 并发删除竞态
    └── 跨线程删除
```
- **用例位置**：专用 `CollectionsMapDeleteTest.test.ets`（51 例：`DELETE_TEST_0100~5100`）+ delete 半数 `CollectionsMapHasDelete.test.ets`（36 例：偶数段 `0200/.../7200`）+ 综合套件 `Normal`/`TaskPool`（各 16 例 `0006~0060`）+ `MapBasic`（3 例 `0014~0016`）+ `Expand1024`（2 例 `0300/1300`）+ `NonOrthogonal`（2 例 `1200~1300`）+ 继承 `Inheritance`（2 例 `0300/1700`）。
- **测了哪些**：boolean 返回 + 联动 has/get/size + 10200201 并发修改 + 跨线程删除 + 全类型键。

## 1.7 clear()

```
clear
├── 入参范围覆盖
│   └── number/string/boolean/null/undefined/Unicode/Infinity/NaN/Map 值 等全类型键 clear
├── 边界值测试
│   ├── 空 Map clear 无副作用
│   ├── 单元素
│   ├── 1000 元素
│   └── 大整数键
├── 异常与非法输入
│   ├── detached/uninitialized→10200011
│   └── forEach 内 clear→10200201
├── 返回值与类型验证
│   ├── void
│   ├── size→0
│   ├── entries/keys/values 迭代器变空
│   └── JSON.stringify 空
├── 组合场景
│   ├── clear→has→false/get→undefined
│   ├── clear 后再 set 再 clear
│   └── 原型方法仍可用
├── 重复调用幂等性
│   ├── 连续多次 clear
│   └── clear 后 delete 无效
└── 并发跨线程
    ├── 跨线程 clear
    └── 子类继承 clear
```
- **用例位置**：专用 `CollectionsMapClearTest.test.ets`（45 例：`CLEAR_TEST_0100~4500`）+ clear 半数 `CollectionsMapClearSize.test.ets`（37 例：奇数段 `0100/0300/.../7100`）+ 综合套件 `Normal`/`TaskPool`（各 8 例 `0007~0060`）+ `NonOrthogonal`（2 例 `1400/1900`）+ `Concurrent`（2 例 `0008`）+ 继承 `Inheritance`（2 例 `0300/1900`）。
- **测了哪些**：void 返回 + size/迭代器/JSON 全清空 + 连续 clear 幂等 + 10200011/10200201 异常 + 跨线程。

## 1.8 keys() / values() / entries()（IterableIterator）

```
keys/values/entries
├── 入参范围覆盖
│   └── 全 36 类型键/值/键值对返回（同 constructor 矩阵）
├── 边界值测试
│   ├── 空 Map→空迭代器 done=true
│   ├── 单对
│   ├── 100/1000/10250 元素
│   └── NaN/+0/-0 区分键
├── 异常与非法输入
│   ├── non-sendable bind→10200011
│   └── forEach 内调用→10200201 并发修改
├── 返回值与类型验证
│   ├── IterableIterator 类型
│   ├── 插入序
│   ├── 每次返回新迭代器
│   └── 含 next() 方法
├── 组合场景
│   ├── 与 get/forEach 一致性
│   ├── Array.from/展开
│   ├── set/delete 后迭代器反映
│   └── for...of
├── 重复调用幂等性
│   ├── 多次 keys()/values() 各得新迭代器
│   └── 可重复遍历
└── 并发跨线程
    ├── TaskPool 多任务并发迭代
    └── Worker 接收后迭代
```
- **用例位置**：
  - keys 半数 `CollectionsMapKeysValues.test.ets`（36 例：奇数段 `0100/.../7100`）+ 散落 `ClearTest`（11 例）、`GetTest`（11 例）等。
  - values 专用 `CollectionsMapValuesTest.test.ets`（47 例：`VALUES_TEST_0100~4700`）+ values 半数 `KeysValues`（36 例：偶数段 `0200/.../7200`）+ `EntriesTest`（7 例）。
  - entries 专用 `CollectionsMapEntriesTest.test.ets`（31 例：`ENTRIES_TEST_0100~3100`）+ entries 半数 `CollectionsMapForEachEntries.test.ets`（36 例：偶数段 `0200/.../7200`）+ entries 迭代序专用 `CollectionsMapEntriesOrderTest.test.ets`（2 例：`ENTRIES_ORDER_0029~0030`——@@iterator(for...of) 与 entries() 序列一致性、delete+re-add 后 keyA 重排至末尾）+ 综合套件 `Normal`/`TaskPool`（各 4 例 `0004~0007`）+ `NonOrthogonal`（3 例）。
  - 跨接口并发 `CollectionsMapConcurrent.test.ets`（4 例 `0100/0600`）+ `MapBasic`（9 例 `0005~0013`）。
- **测了哪些**：插入序 + 新迭代器语义 + 全类型 + SameValueZero 键区分 + 10200011/10200201 异常 + for...of/Array.from/展开互操作 + 跨线程迭代 + delete 后 re-add 重排至末尾 + @@iterator 与 entries() 序列等价性。

## 1.9 forEach(callbackFn)

```
forEach
├── 入参范围覆盖
│   └── 全 36 类型键值遍历 + 各类型 value（NaN/Infinity/BigInt/Unicode/多行串/TestClass）
├── 边界值测试
│   ├── 空 Map 不执行回调
│   ├── 单元素
│   ├── 10/100/1000/10000 元素
│   └── 1024 边界后
├── 异常与非法输入
│   ├── 回调非函数→401
│   ├── forEach 内 delete/clear→10200201
│   ├── 回调抛 CustomError
│   └── detached→10200011
├── 返回值与类型验证
│   ├── value/key/map 三参顺序(value 先 key 后)
│   ├── 插入序
│   └── 回调返回值被忽略
├── 组合场景
│   ├── forEach+entries 过滤
│   ├── 闭包修改
│   ├── 模板字面量
│   ├── nullish 合并
│   └── 不遍历原型
├── 重复调用幂等性
│   ├── 重复键(覆盖)只遍历最新
│   ├── 删后不遍历
│   └── 空回调
└── 并发跨线程
    ├── 3 TaskPool 并发 forEach
    ├── Promise.all 等待
    ├── sendData 上报
    └── 嵌套 Map 结构
```
- **用例位置**：专用 `CollectionsMapForeachTest.test.ets`（42 例：`FOREACH_TEST_0100~4200`）+ forEach 半数 `CollectionsMapForEachEntries.test.ets`（36 例：奇数段 `0100/0300/.../7100`）+ forEach thisArg 专用 `CollectionsMapThisArgTest.test.ets`（3 例：`THISARG_2300~2500`——delete 后 forEach 跳过已删条目+thisArg 上下文、无 thisArg 基础遍历、@Sendable 类方法 ESObject 绑定）+ 综合套件 `Normal`/`TaskPool`（各 4 例 `0028~0031`）+ `MapBasic`（2 例 `0020~0021`）+ `NonOrthogonal`（3 例 `1700/2100/2800`）+ `Concurrent`（8 例 `0100~2000`）+ `Expand1024`（1 例 `1600`）+ 继承 `Inheritance`（2 例 `0400/1800`）。
- **测了哪些**：三参顺序 + 插入序 + 全类型 + 401/10200011/10200201 全异常码 + 跨线程并发 forEach + 大规模遍历 + thisArg 上下文绑定（@Sendable MapContext 闭包访问 tag + ESObject 方法 call 绑定）。

## 1.10 put(key, value)（@since 26.0.1）

```
put
├── 入参范围覆盖
│   └── NewApiType 46 例×(number/string/boolean/null/undefined/各 Sendable 类/嵌套/大对象/循环引用) 类型
├── 边界值测试
│   ├── 1023/1024/1025 跨边界
│   ├── 10250 元素新增/覆盖
│   └── 大对象
├── 异常与非法输入
│   └── detached put→10200011 bind 错误
├── 返回值与类型验证
│   ├── 新键→undefined
│   ├── 覆盖→旧值
│   ├── NaN/+0/-0 SameValueZero 返回旧值
│   ├── Sendable 引用相等返回旧值
│   └── 返回类型显式 string|undefined 捕获
├── 组合场景
│   ├── 连续 put 同键返回连续旧值并保留最新
│   ├── TaskPool 传递后 put
│   └── instanceof 校验
├── 重复调用幂等性
│   ├── 重复 put 同键 size 不增
│   └── 返回旧值序列
└── 并发跨线程
    ├── AsyncLock 多线程并发写不同键
    └── Worker 接收 Map 调 put
```
- **用例位置**：专用 `CollectionsMapPutTest.test.ets`（17 例：`PUT_0600~4200`）+ 新 API 全类型矩阵 `CollectionsMapNewApiTypeTest.test.ets`（46 例：`NEW_API_TYPE_0100~4600`，每例同测 put/containsValue/putAll/remove 四新 API）+ `ContainsValueTest`（1 例 `0700` 联动）。
- **测了哪些**：返回旧值/undefined 语义 + SameValueZero + 跨边界 + 10200011 + 并发 AsyncLock/Worker + 全类型矩阵。

## 1.11 remove(key)（@since 26.0.1）

```
remove
├── 入参范围覆盖
│   └── NewApiType 46 例全类型键移除
├── 边界值测试
│   ├── 1023/1024/1025 边界
│   ├── 10250 元素删中位/删空/删不存在
│   └── 3 元素跨线程
├── 异常与非法输入
│   ├── detached remove→10200011 bind 错误
│   └── >16MB 跨线程错误
├── 返回值与类型验证
│   ├── 存在→返回旧值并 size--
│   ├── 缺失→undefined 不变 size
│   ├── 旧值为 undefined 时仍 undefined
│   ├── NaN/+0/-0 SameValueZero
│   ├── Sendable 引用相等
│   └── 显式 string|undefined 类型捕获
├── 组合场景
│   ├── instanceof 校验
│   └── 跨 TaskPool 传递后 remove
├── 重复调用幂等性
│   └── 重复 remove 同键 先旧值后 undefined
└── 并发跨线程
    ├── AsyncLock 多线程并发 remove
    └── Worker 调 remove 触发 >16MB 跨线程错误
```
- **用例位置**：专用 `CollectionsMapRemoveTest.test.ets`（17 例：`REMOVE_0500~4300`）+ 新 API矩阵 `NewApiType`（46 例）+ `DeleteTest`（1 例 `0700`，delete/remove 语义联动）。
- **测了哪些**：返回旧值/undefined + SameValueZero + 跨边界/大容量 + 10200011 + >16MB 跨线程 + 全类型。

## 1.12 containsValue(value)（@since 26.0.1）

```
containsValue
├── 入参范围覆盖
│   └── NewApiType 46 例全类型值匹配
├── 边界值测试
│   ├── 空 Map→false
│   ├── 1023/1024/1025 边界
│   └── 10250 元素存在/不存在/连续重复值
├── 异常与非法输入
│   ├── detached→10200011 bind 错误
│   └── 竞态下 10200201 报文含 'Concurrent modification exception'
├── 返回值与类型验证
│   ├── true/false
│   ├── SameValueZero 匹配 NaN
│   ├── +0/-0
│   ├── Sendable 引用相等
│   └── 多键同值均命中
├── 组合场景
│   ├── put 写 + containsValue 读（AsyncLock 保护）
│   └── 四新 API 联动
├── 重复调用幂等性
│   └── 连续重复值命中一致
└── 并发跨线程
    ├── AsyncLock 多线程读写
    ├── TaskPool 传递后调用
    └── Worker 调 containsValue
```
- **用例位置**：专用 `CollectionsMapContainsValueTest.test.ets`（18 例：`CONTAINS_VALUE_0700~4100`）+ 新 API矩阵 `NewApiType`（46 例）。
- **测了哪些**：SameValueZero 值匹配 + Sendable 引用 + 大容量边界 + 10200011/10200201 + 跨线程读写。

## 1.13 putAll(from)（@since 26.0.1，两个重载）

```
putAll
├── 入参范围覆盖
│   └── collections.Map 源 + 内置 ReadonlyMap(BuiltinMap) 源 + 子类源 + 全类型值（NewApiType 46 例）
├── 边界值测试
│   ├── 空源 no-op
│   ├── 1023/1024/1025 边界
│   ├── 1000 批写
│   ├── 10250 批写
│   └── self 作源 no-op
├── 异常与非法输入
│   ├── receiver.entries() 内调→10200201
│   ├── detached putAll→10200011
│   └── forEach 内调→10200201
├── 返回值与类型验证
│   ├── void
│   ├── 覆盖既有键
│   └── 连续重复键保留最后值
├── 组合场景
│   ├── Map 源 + 内置源两重载对比
│   ├── 子类源
│   └── TaskPool/Worker 子线程构造源
├── 重复调用幂等性
│   └── 空源多次 no-op
└── 并发跨线程
    └── Worker/TaskPool 子线程构造源再 putAll
```
- **用例位置**：专用 `CollectionsMapPutAllSendableTest.test.ets`（12 例：`PUT_ALL_0900~4100`，Map 源）+ `CollectionsMapPutAllBuiltinTest.test.ets`（9 例：`PUT_ALL_3100~4600`，内置 Map 源）+ 新 API矩阵 `NewApiType`（46 例）+ `PutTest`（1 例 `0900` 空 Map putAll 联动）。
- **测了哪些**：两重载覆盖语义 + 边界/大容量批写 + 10200201/10200011 + self 源 no-op + 子线程构造源。

## 1.14 [Symbol.iterator]()

```
[Symbol.iterator]
├── 入参范围覆盖
│   └── （间接，通过 entries/keys/values 迭代器）
├── 边界值测试
│   ├── 空 Map 迭代器
│   └── 大 Map 迭代
├── 异常与非法输入
│   └── bind→10200011（声明注明 .ets 不可直接调用，无法直接 bind 测试）
├── 返回值与类型验证
│   ├── IterableIterator<[K,V]>
│   └── for...of 可消费
├── 组合场景
│   └── Array.from/展开运算符转数组
├── 重复调用幂等性
│   └── 每次返回新迭代器
└── 并发跨线程
    └── 跨线程迭代器
```
- **用例位置**：**未发现专用用例**（`.d.ets` L1108 声明注明"This API cannot be used in .ets files"，故无直接 `map[Symbol.iterator]()` 调用测试）。间接覆盖：`EntriesTest`（9 例 for...of/Array.from）、`ValuesTest`（5 例 展开运算符）、`MapBasic`（9 例 entries/keys/values 迭代器）、`NonOrthogonal`（1 例 `1500` IterableIterator 类型校验）、`Inheritance`（1 例 `0500`）。
- **测了哪些**：仅间接覆盖迭代器协议；**直接 Symbol.iterator 调用为契约禁用，建议保留禁用声明符合性证据**。

## 1.15 capacity/expand（内部扩容边界 1024，行为维度）

```
capacity/expand
├── 入参范围覆盖
│   └── number/string/emoji/超长串/对象引用/Sendable 实例 键跨边界
├── 边界值测试
│   ├── 1023→1024→1025 跨边界保留
│   ├── 删 100 键
│   ├── 跨边界后值读取一致
│   ├── NaN/+0/-0 跨边界语义
│   └── 零宽空格区分
├── 异常与非法输入
│   └── （无直接异常用例）
├── 返回值与类型验证
│   ├── 跨边界后 size/forEach 一致
│   └── TaskPool 传递后 API 可用
├── 组合场景
│   ├── 跨边界删后重建
│   └── 并发读者/写者容错
├── 重复调用幂等性
│   └── 重复键跨边界保持唯一
└── 并发跨线程
    ├── 3 并发 TaskPool 写者容错
    ├── 读者+写者容错
    └── TaskPool 插入进度上报
```
- **用例位置**：专用 `CollectionsMapExpand1024Test.test.ets`（19 例：`EXPANSION_1024_0100~1900`）。
- **测了哪些**：1024 内部扩容边界前后的键保留/值一致/SameValueZero/并发容错；**属未声明的内部行为，覆盖充分但无契约异常码用例**。

---

# 2. 稳定性

- **用例位置**：`CollectionsMapConcurrent.test.ets`（`1900` 循环创建销毁 1000 次、`2100` 500000 超大 Map、`2200` 100000 传递 TaskPool）+ `Expand1024`（大容量边界）+ 各 72-矩阵文件 large object/array/深嵌套/循环引用 用例（如 `Constructor_6500~7200`、`KeysValues_6500~7200`）。
- **测了哪些**：超大规模创建/销毁/传递稳定性 + 大对象/深嵌套/循环引用承载 + 1024 扩容稳定性。

# 3. 性能

- **用例位置**：`CollectionsMapConcurrent.test.ets`（`2000` 100×10000 forEach 性能、`2100` 500000 创建性能）+ `CollectionsMapHasTest.test.ets`（`3400` 大数量键 has 性能）+ `CollectionsMapValuesTest.test.ets`（`4200` 超大 value 内存占用、`2800` 1000 元素）。
- **测了哪些**：大规模 forEach 吞吐、大数量键 has 性能、超大 value 内存占用；**未见 put/get/delete 等单接口基线性能基准用例**。

# 4. 并发安全

- **用例位置**：`CollectionsMapConcurrent.test.ets`（22 例 `0100~2200`：3 TaskPool 并发 forEach/delete 内回调→10200201、Worker 跨线程、AsyncLock 并发 set、@Concurrent 参数/返回、ConditionVariable 同步、sendData 上报）+ `Concurrent/MapConcurrent.test.ets`（19 例 `0001~0019`：Map+Set 全接口并发 smoke）+ `TaskPool/MapTaskPool.test.ets`（60 例 `0001~0060`：Normal 同场景跨 TaskPool 复跑）+ 各新 API 文件的 AsyncLock/Worker 用例（`Put_0600`、`Remove_0500/0600`、`ContainsValue_0700`、`PutAllSendable_1100`、`PutAllBuiltin_4200/4500`）+ `Expand1024`（`1400/1500/1700` 并发容错）+ `Put_4000`/`Remove_4100` 跨线程传递后调用。
- **测了哪些**：TaskPool/Worker 跨线程引用传递 + AsyncLock/CV 同步 + 10200201 并发修改错误 + 并发读写容错；**未发现显式多 Worker 写写冲突下数据一致性断言用例**（多为不抛错即通过）。

# 5. 兼容性与继承

- **用例位置**：`collections/MapInheritanceTest.test.ets`（28 例 `0100~2800`：子类 instanceof/原型链、无参/带参/super 构造、继承 @Sendable 跨线程、继承 get/has/delete/forEach/clear、覆写 set、自定义 sumValues/average/doubleAll 方法、二级继承链、多 TaskPool 共享子类实例）+ `CollectionsMapNonOrthogonal.test.ets`（`2700~3400`：子类扩展自定义方法、覆写 forEach、instanceof、泛型与子类）。
- **测了哪些**：子类化 + @Sendable 继承 + 方法覆写/自定义 + 二级继承 + 跨线程引用传递；**未见子类对 put/remove/containsValue/putAll 新 API 的继承/覆写用例**。

# 6. 资料与文档符合性

- **用例位置**：`CollectionsMapNonOrthogonal.test.ets`（`2200` @Sendable 装饰验证、`2300` @Concurrent+TaskPool、`2400` import 可用性、`2500~2600` 泛型必须 Sendable/非 Sendable 报错、`0100~0500/1500` 构造/set/get/has/delete/clear/entries-keys-values 类型符合性）+ `ContainsValueTest`（`1000` instanceof + 方法可用性）+ `Put_4100`/`Remove_4200`/`PutAll` instanceof 用例。
- **测了哪些**：@Sendable 装饰、import、泛型 Sendable 约束、instanceof、新 API 方法可用性；**未发现与文档 `arkts-apis-arkts-collections-Map.md` 逐条断言的符合性用例**。

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口×测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅(72) | ✅ | ✅(401/10200012) | ✅(instanceof) | ✅ | 🟡 | 🟡(继承) |
| size | ✅ | ✅(1024/大容量) | ❌(只读无异常契约) | ✅ | ✅ | ✅ | ✅ |
| set | ✅(36) | ✅(1024) | 🟡(间接) | ✅(链式返回) | ✅ | ✅ | ✅ |
| get | ✅(41) | ✅ | ✅(10200011) | ✅(undefined) | ✅ | ✅ | ✅ |
| has | ✅(36) | ✅(大数量) | 🟡(间接) | ✅(SameValueZero) | ✅ | ✅ | ✅ |
| delete | ✅(53) | ✅(首末/大Map) | ✅(10200201/10200011) | ✅(boolean) | ✅ | ✅ | ✅ |
| clear | ✅ | ✅(空/大) | ✅(10200011/10200201) | ✅(void/迭代器空) | ✅ | ✅ | ✅ |
| keys | ✅(36) | ✅ | ✅(10200011/10200201) | ✅(IterableIterator) | ✅ | ✅ | ✅ |
| values | ✅(47) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| entries | ✅(31+36) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| forEach | ✅(42+36) | ✅(空/10000) | ✅(401/10200011/10200201/CustomError) | ✅(三参顺序) | ✅ | ✅ | ✅ |
| [Symbol.iterator] | 🟡(间接) | 🟡 | ❌(.ets 禁用) | 🟡 | 🟡 | 🟡 | 🟡 |
| put | ✅(18+48) | ✅(1024/10250) | ✅(10200011) | ✅(旧值/undefined) | ✅ | ✅ | ✅ |
| remove | ✅(18+48) | ✅(1024/10250) | ✅(10200011/>16MB) | ✅(旧值/undefined) | ✅ | ✅ | ✅ |
| containsValue | ✅(19+48) | ✅(1024/10250) | ✅(10200011/10200201) | ✅(SameValueZero) | ✅ | 🟡 | ✅ |
| putAll | ✅(13+10+48) | ✅(1024/10250/空源) | ✅(10200011/10200201) | ✅(void/覆盖) | ✅ | ✅ | ✅ |
| capacity/expand | ✅ | ✅(1024边界) | ❌(无异常契约) | ✅(一致) | ✅ | ✅ | ✅ |

## 7.2 逐接口遗漏确认（对照 .md 与 @arkts.collections.d.ets）

> 图例：✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口（已测但未声明） / 🔴 产品或测试缺陷。所有结论经实际测试代码逐行复核。

| # | 接口 | 契约要点（.d.ets / .md） | 核查结论 |
|---|------|--------------------------|----------|
| 1 | `size`（readonly） | 只读属性，无 @throws | ✅ 覆盖：随增删改/clear/并发一致性（ClearSize/Delete/Remove/Normal/TaskPool/Concurrent/Inheritance 散落断言）。无异常契约，无缺口。 |
| 2 | `constructor①(entries?: readonly (readonly [K,V])[] \| null)` | @throws 10200012 | ✅ 覆盖：entries 数组/null/undefined/空数组/全类型矩阵（ConstructorTest 19 + ConstructorTest01 72 + NonOrthogonal_0100~0500）。⚠️ **401 已测未声明**（NonOrthogonal_1600，非法 iterable→401）。🔴 **10200012 误标**：NonOrthogonal_2000 `@tc.desc` 声称 10200012 但实际 `new Map(null)` 构造成功，catch 永不触发；10200012 为内部不可达守卫（见 §7.4）。 |
| 3 | `constructor②(iterable: Iterable<readonly [K,V]>)` | @throws 10200012 | ✅ 覆盖：Iterable 对象构造（NonOrthogonal_0300、ConstructorTest01 iterable 段）。⚠️ 401 与 ctor① 共享 NonOrthogonal_1600。10200012 同上不可达。 |
| 4 | `[Symbol.iterator]()` | @throws 10200011；.d.ets L1108 注 "cannot be used in .ets files" | ❌ 无专用用例（契约禁用直接调用，正确）。间接覆盖：entries/keys/values/for...of/Array.from。**建议保留禁用声明符合性证据**（SUP_MAP_SYMBOL_ITER_001）。 |
| 5 | `entries()` | @throws 10200011, 10200201 | ✅ 覆盖：专用 EntriesTest 31 + ForEachEntries 36 + EntriesOrderTest 2（迭代序）+ 综合套件。10200011 专用（NonOrthogonal_1800 detached）。10200201 间接（forEach 内迭代器）。 |
| 6 | `keys()` | @throws 10200011, 10200201 | ✅ 行为覆盖（KeysValues 36 + 散落）；❌ **10200011 detached 专用缺失**（仅 entries/clear 有 detached 专用，keys 无，见 SUP_MAP_KEYS_BIND_001）。 |
| 7 | `values()` | @throws 10200011, 10200201 | ✅ 行为覆盖（ValuesTest 46 + KeysValues 36）；❌ **10200011 detached 专用缺失**（SUP_MAP_VALUES_BIND_001）。 |
| 8 | `clear()` | @throws 10200011, 10200201 | ✅ 覆盖：专用 ClearTest 45 + ClearSize 37。10200011 专用（NonOrthogonal_1900 detached）。10200201 专用（forEach 内 clear）。 |
| 9 | `containsValue(value)` @since 26.0.1 @stagemodelonly | @throws 10200011, 10200201 | ✅ 覆盖：专用 ContainsValueTest 18 + NewApiType 46。10200011 专用（CONTAINS_VALUE_4000 detached）。10200201 专用（CONTAINS_VALUE_4100 报文含 'Concurrent modification exception'）。❌ **401 未测**（value 必填，SUP_MAP_CONTAINSVALUE_401_001）；⚠️ 401 未声明。 |
| 10 | `delete(key)` | @throws 10200011, 10200201 | ✅ 覆盖：DeleteTest 51 + HasDelete 36。10200201 专用（Concurrent_0002 forEach 内 delete，但弱断言 `0‖10200201`，见 F.1 改造）。missing-key→false 覆盖（NonOrthogonal_0013）。❌ **10200011 detached 专用缺失**（SUP_MAP_DELETE_BIND_001）；❌ **401 未测**（SUP_MAP_DELETE_401_001）；⚠️ 401 未声明。 |
| 11 | `remove(key)` @since 26.0.1 | @throws 10200011, 10200201 | ✅ 覆盖：RemoveTest 17 + NewApiType 46。10200011 专用（REMOVE_4000 detached）。missing-key→undefined（REMOVE_3100/3900）；old-value-undefined 区分（REMOVE_3200）。❌ **401 未测**（SUP_MAP_REMOVE_401_001）；⚠️ 401 未声明。 |
| 12 | `forEach(callbackFn)` | @throws 10200011, 10200201 | ✅ 覆盖：ForeachTest 42 + ForEachEntries 36 + ThisArgTest 3（thisArg 上下文绑定）。401 专用（NonOrthogonal_1700 非函数回调→401）。10200201 覆盖（NonOrthogonal_2100 forEach→set、Concurrent_0002 forEach→delete、PutAll_4100 forEach→putAll(self)）但 **2100/0002 弱断言**（`0‖10200201`，见 F.1 改造）。❌ forEach→put / forEach→remove / forEach→putAll(builtin) 未测（SUP_MAP_FOREACH_MOD_PUT/REMOVE/PUTALL_BUILTIN_001）；⚠️ 401 已测未声明。 |
| 13 | `get(key)` | @throws 10200011, 10200201 | ✅ 行为覆盖：GetTest 39 + SetGet 36。missing-key→undefined 覆盖（NonOrthogonal_0009）。❌ **10200011 detached 专用缺失**（SUP_MAP_GET_BIND_001）；❌ **401 未测**（SUP_MAP_GET_401_001）；⚠️ 401 未声明。 |
| 14 | `has(key)` | @throws 10200011, 10200201 | ✅ 行为覆盖：HasTest 34 + HasDelete 36。❌ **10200011 detached 专用缺失**（SUP_MAP_HAS_BIND_001）；❌ **401 未测**（SUP_MAP_HAS_401_001）；⚠️ 401 未声明。 |
| 15 | `put(key, value)` @since 26.0.1 | @throws 10200011, 10200201 | ✅ 覆盖：PutTest 17 + NewApiType 46。10200011 专用（PUT_3900 detached）。旧值/undefined、SameValueZero(NaN/+0/-0)、Sendable 引用、显式类型捕获均覆盖。❌ **401 未测**（SUP_MAP_PUT_401_001）；⚠️ 401 未声明。 |
| 16 | `putAll①(from: Map<K,V>)` @since 26.0.1 | @throws 10200011, 10200201 | ✅ 覆盖：PutAllSendableTest 12。10200011 专用（PUT_ALL_3900 detached）。10200201 专用（PUT_ALL_4100 forEach 内 putAll(self)）。覆盖/空源/self/no-op/dup/边界/子类源全覆盖。❌ **401 未测**（SUP_MAP_PUTALL_401_001）；⚠️ 401 未声明。 |
| 17 | `putAll②(from: ReadonlyMap<K,V>)` @since 26.0.1 | @throws 10200011, 10200201 | ✅ 行为覆盖：PutAllBuiltinTest 9。覆盖/空源/dup/边界/TaskPool/Worker 源全覆盖。❌ **10200011 detached 专用缺失**（与 putAll① 共享方法对象，但 builtin 路径未独立取证，SUP_MAP_PUTALL_BUILTIN_BIND_001）；❌ **10200201 未测**（forEach 内 putAll(builtin)，SUP_MAP_FOREACH_MOD_PUTALL_BUILTIN_001）；❌ 401 未测；⚠️ 401 未声明。 |
| 18 | `set(key, value)` | @throws 10200011, 10200201；返回 Map 本身 | ✅ 行为覆盖：SetGet 36 + 链式 set().set() 34 处。返回自身契约（NonOrthogonal_0600/0700 单层 ref）。❌ **10200011 detached 专用缺失**（SUP_MAP_SET_BIND_001）；❌ **401 未测**（SUP_MAP_SET_401_001）；❌ 多层链式同引用显式断言缺失（SUP_MAP_SET_CHAIN_REF_001）；⚠️ 401 未声明。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. **返回新对象独立性**：(a) entries/keys/values 每次返回**新迭代器**且可重复遍历——已覆盖（EntriesTest/KeysValues ⑥ 段）。(b) `set` 返回**同一 Map 实例**（非新对象）——单层 ref 覆盖（NonOrthogonal_0600/0700），**多层链式 `set().set()` 同引用显式断言缺失**（SUP_MAP_SET_CHAIN_REF_001）。(c) `putAll` 源 Map 独立性（putAll 后源不变）——collections.Map 源（PUT_ALL_3000 校验 source.size/get 不变）、builtin 源（PUT_ALL_3100 校验 source.size 不变）均覆盖。✅ 此项基本覆盖，仅 set 多层链式显式断言补强。

2. **状态变更后旧键访问**：(a) delete→get/has→undefined/false——覆盖（DeleteTest、NonOrthogonal_0012）。(b) remove→has/get→false/undefined——覆盖（REMOVE_3000/3100）。(c) clear→size=0/get→undefined/has→false/迭代器空——覆盖（ClearTest、ClearSize）。✅ 全覆盖。

3. **delete/remove 缺失键语义**：delete 缺失→false（NonOrthogonal_0013、DeleteTest）；remove 缺失→undefined（REMOVE_3100/3900）。✅ 覆盖。

4. **putAll 两重载对比**：① collections.Map 源（PutAllSendableTest 12）、② builtin ReadonlyMap 源（PutAllBuiltinTest 9）均有覆盖/空源/dup/边界/子线程源对位用例。但 ② 的 detached 10200011、forEach 内 10200201 未独立覆盖（见 §7.2 第 17 行）。⚠️ 部分缺口。

5. **constructor 两重载 + null→empty**：① entries 数组、② Iterable、null/undefined/空数组→空 Map 全覆盖（ConstructorTest/ConstructorTest01/NonOrthogonal_0100~0500）。✅ 覆盖。

6. **forEach 回调修改 Map（声明 10200201）**：仅覆盖 set（NonOrthogonal_2100）、delete（Concurrent_0002）、clear、putAll(self)（PutAll_4100）；**put / remove / putAll(builtin) 未测**（SUP_MAP_FOREACH_MOD_PUT/REMOVE/PUTALL_BUILTIN_001）。且现有 set/delete 用例为弱断言 `0‖10200201`（不抛即通过），无法检测停止抛错的回归。❌ 组合缺口。

7. **NewApiType 矩阵内 putAll 语义**：46 例中 putAll 均用**new键**（`str+'_x'`、`99990+`、`bsrc_xx`），**未在矩阵内行使 putAll 覆盖既有键 / 空源 no-op / self 源 no-op**（仅 PutAllSendable/BuiltinTest 单测覆盖）。且每例串联 4 API 致失败级联，**per-API 定位弱**（见 C.1 改造、SUP_MAP_NEWAPI_PUTALL_OVERWRITE/EMPTYSRC_001）。❌ 组合缺口。

8. **并发写写数据一致性**：putRace/removeRace/containsValueRace 均断言 `code===0‖code===10200201`（不抛即通过），lockedPutTask/lockedRemoveTask 仅 `code===0`；**无多写者写写逐键值正确性断言**（唯一写一致性是 Concurrent_0009 单键 `get('locked_key')===999`）。❌ 掩盖真实数据损坏（SUP_MAP_CONC_DISTINCT_KEYS/SAME_KEY/REMOVE_VERIFY_001）。

9. **10200012 误标**：NonOrthogonal_2000 声称 10200012 但实际 null→empty 成功（与 0500 重复），catch 永不触发；10200012 为内部不可达守卫。🔴 测试缺陷（E.1 改造）。

10. **401 覆盖面**：仅 ctor（NonOrthogonal_1600）+ forEach（NonOrthogonal_1700）测 401；set/get/has/delete/put/remove/containsValue/putAll 共 8 个带必填参数成员**无 401 测试**，且声明侧**全部未声明 401**（⚠️ 文档缺口，见 §7.4）。

## 7.4 文档与测试一致性建议（同步资料侧）

1. **401 未声明（⚠️ 文档缺口）**：`.d.ets` 对 set/get/has/delete/put/remove/containsValue/putAll(×2) 共 8 个带必填参数成员**均未 `@throws 401`**，但产品实际对非法参数抛 401（ctor/forEach 已验证）。建议在 `.d.ets` 与 `.md` 错误码表为上述 8 成员补 `@throws BusinessError 401 - The parameter check failed.`，与 ArkTS 401 通用规范一致。同步增补测试（SUP_MAP_401_*，见补充设计 B 组）。

2. **10200012 不可达性说明**：10200012 "constructor cannot be directly invoked" 为内部守卫，从 .ets 正常 `new collections.Map()` 不可达。建议在 `.md` constructor 错误码说明补注"该错误码为内部直接调用守卫，应用层 `new` 构造不可触发"，避免资料侧被误解为可在应用层验证。同步修正 NonOrthogonal_2000 误标（E.1）。

3. **[Symbol.iterator] 禁用声明保留**：`.d.ets` L1108 "This API cannot be used in .ets files" 与 `.md` §[Symbol.iterator] "本接口不支持在.ets文件中使用" 一致。建议保留该禁用声明，并在测试侧以静态符合性证据固化（SUP_MAP_SYMBOL_ITER_001），不强行构造运行期用例。

4. **putAll 两重载错误码对称性**：`.d.ets` 对 putAll①(Map) 与 putAll②(ReadonlyMap) 声明完全对称（10200011+10200201），但测试侧 ② 缺 detached 10200011 与 forEach 内 10200201 独立用例。建议资料侧保持对称声明，测试侧补齐 ② 独立异常用例（SUP_MAP_PUTALL_BUILTIN_BIND_001、SUP_MAP_FOREACH_MOD_PUTALL_BUILTIN_001）。

5. **forEach 回调并发修改契约**：`.md` forEach 参数说明已注"回调执行期间不能修改当前 Map 对象，否则会触发并发修改错误"，与 `.d.ets` 10200201 一致。建议测试侧将 set/delete 的弱断言 `0‖10200201` 强化 pin 为 `assertEqual(10200201)`，并补 put/remove/putAll(builtin) 三路径（F 组）。

6. **NewApiType 矩阵 putAll 语义**：`.md` putAll 已明示"覆盖当前 Map 中对应的值；否则新增键值对"。建议测试矩阵内补 putAll 覆盖既有键与空源 no-op 用例（SUP_MAP_NEWAPI_PUTALL_OVERWRITE/EMPTYSRC_001），使矩阵与单测语义对齐。

## 7.5 优先级建议

| 优先级 | 数量 | 范围 | 说明 |
|--------|------|------|------|
| **P0** | 2 | SUP_MAP_CONC_DISTINCT_KEYS_001、SUP_MAP_CONC_SAME_KEY_001 | 多写者并发写写数据一致性——现有套件"不抛即通过"掩盖真实数据损坏，最高优先。 |
| **P1** | 19 | A 组 7（10200011 detached 补全 get/has/set/delete/keys/values/putAll-builtin）+ B 组 8（401 补全 set/get/has/delete/put/remove/containsValue/putAll）+ D 组 1（SUP_MAP_CONC_REMOVE_VERIFY_001）+ F 组 3（forEach 内 put/remove/putAll(builtin) 10200201）+ 改造 E.1（NonOrthogonal_2000 误标）/F.1（2100+0002 弱断言强化） | 声明 @throws 但无直接证据、或弱断言无法检测回归；属契约符合性硬缺口。 |
| **P2** | 5 | C 组 2（NewApi 矩阵 putAll 覆盖/空源）+ E.2（10200012 不可达性证据）+ G 组 1（Symbol.iterator 禁用符合性）+ I 组 1（set 多层链式同引用）+ 改造 C.1（NewApiType 46 例拆分） | 覆盖已存在但定位弱 / 契约禁用需固化证据；非阻断但提升套件质量。 |
| **合计** | **26 新增 + 4 改造** | | P0=2 / P1=19 / P2=5（按新增计）；改造项 C.1/E.1/F.1 随所属优先级。 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（key/value/回调/源 Map）遍历合法类型空间 | 72-矩阵文件按 number/string/boolean/null/undefined/Sendable/嵌套 等逐类型用例 |
| ②边界值测试 | 空容器、单元素、容量阈值(1023/1024/1025)、极值(MAX_SAFE_INTEGER/NaN/±0/±Infinity)、大规模(1000/10250/500000) | Expand1024、大 Map、空 Map 用例 |
| ③异常与非法输入 | 非法参数(401)、构造失败(10200012)、detached bind(10200011)、并发修改(10200201)、>16MB 跨线程 | NonOrthogonal 异常码段、forEach 内 delete/clear |
| ④返回值与类型验证 | 返回值语义(undefined/旧值/boolean/void/Map 实例/IterableIterator)、instanceof、显式类型捕获 | put/remove 旧值、delete/clear 返回、entries 迭代器类型 |
| ⑤组合场景 | 多接口串联(set→delete→clear→get→has)、跨 API 联动(put↔containsValue)、源 Map↔接收方 | Normal/TaskPool 综合场景、NewApiType 四 API 联动 |
| ⑥重复调用幂等性 | 同操作连续调用结果稳定、不产生副作用膨胀 | 连续 clear、delete 两次、重复 put 同键 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock/ConditionVariable 同步、多写者竞态、跨线程调用 | Concurrent/MapTaskPool/CollectionsMapConcurrent 全部、各新 API AsyncLock 用例 |
