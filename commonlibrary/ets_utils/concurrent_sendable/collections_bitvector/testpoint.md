# BitVector 测试点报告（按接口维度·摘要版）

> 本报告按 **接口维度** 组织，每个接口用脑图式分类树 **简单展示"测了哪些"**，并标注 **用例位置**（所在测试文件）。
> 数据来源：当前最新代码（`entry/src/ohosTest/ets/test/BitVector*.test.ets`，20 个测试文件、682 个活跃用例、0 注释）。
> 接口契约来源：`interface/sdk-js/arkts/@arkts.collections.d.ets`（BitVector 类，17 个成员）。
> 配套：`collections_bitvector_testdesign.md`（tab 层级脑图，可导入思维导图）。
> 更新日期：2026-11-04。

---

## 0. 脑图总览（顶层结构）

```
BitVector
├── 1. 接口测试（Functional / Interface）  —— §1，每接口含用例位置
│   ├── 1.1 constructor        ├── 1.7  setAllBits
│   ├── 1.2 length             ├── 1.8  getBitsByRange
│   ├── 1.3 push               ├── 1.9  getBitCountByRange
│   ├── 1.4 pop                ├── 1.10 resize
│   ├── 1.5 has                ├── 1.11 getIndexOf
│   └── 1.6 setBitsByRange     ├── 1.12 getLastIndexOf
│                              ├── 1.13 flipBitByIndex
│                              ├── 1.14 flipBitsByRange
│                              ├── 1.15 values / [Symbol.iterator]
│                              └── 1.16 [index] 索引访问器
├── 2. 稳定性（Stability）
├── 3. 性能（Performance）
├── 4. 并发安全（Concurrency Safety）
├── 5. 兼容性与继承
└── 6. 资料与文档符合性
```

每个接口下一层统一按 **测试逻辑分类**：① 入参范围覆盖 ② 边界值测试 ③ 异常与非法输入 ④ 返回值与类型验证 ⑤ 组合场景 ⑥ 重复调用/幂等性 ⑦ 并发跨线程。

---

## 0.1 文件清单（20 个文件 / 682 用例）

| # | 文件 | 用例数 | 接口覆盖 |
|---|------|:---:|------|
| 1 | BitVectorConstructor.test.ets | 31 | constructor / length |
| 2 | BitVectorPush.test.ets | 43 | push |
| 3 | BitVectorPop.test.ets | 27 | pop |
| 4 | BitVectorHas.test.ets | 54 | has |
| 5 | BitVectorSetBitsByRange.test.ets | 49 | setBitsByRange |
| 6 | BitVectorSetAllBits.test.ets | 26 | setAllBits |
| 7 | BitVectorGetBitsByRange.test.ets | 50 | getBitsByRange |
| 8 | BitVectorGetBitCountByRange.test.ets | 57 | getBitCountByRange |
| 9 | BitVectorResize.test.ets | 48 | resize |
| 10 | BitVectorGetIndexOf.test.ets | 44 | getIndexOf |
| 11 | BitVectorGetLastIndexOf.test.ets | 43 | getLastIndexOf |
| 12 | BitVectorFlipBitByIndex.test.ets | 35 | flipBitByIndex |
| 13 | BitVectorFlipBitsByRange.test.ets | 46 | flipBitsByRange |
| 14 | BitVectorValues.test.ets | 44 | values / [Symbol.iterator] |
| 15 | BitVectorIndexAccess.test.ets | 22 | [index] |
| 16 | BitVectorUnbound.test.ets | 31 | 方法解绑 / 跨线程读写 / 跨线程创建 |
| 17 | BitVectorConcurrentSingle.test.ets | 8 | 100 并发 TaskPool（单任务） |
| 18 | BitVectorConcurrentMulti.test.ets | 7 | 100 并发 TaskGroup（多任务） |
| 19 | BitVectorTest.test.ets（综合套件） | 17 | resize/values/并发/兼容性（去重后仅保留 4300–4700/6400–6500/6900–7300） |
| 20 | List.test.ets（聚合器） | 0 | re-export，0 条 @tc.name |
| | **合计** | **682** | 19 个测试文件 + 1 聚合器 |

---

# 1. 接口测试（Functional / Interface）

## 1.1 constructor(length: number)

```
constructor
├── 入参范围覆盖
│   ├── 正常数值：length=10/1/8/1024/100000/1000000，验证 length 一致
│   ├── length=0 空容器，length=0
│   └── 容量规格：cap=64/128/1024/1025(跨1024) 构造
├── 边界值测试
│   ├── size=0 空容器
│   ├── 64/128/1024 word 边界构造（cap=64、128、1024、1025）
│   └── 大长度 100000 / 1000000
├── 异常与非法输入
│   ├── 类型错误 401：浮点(10.5/0.5)、NaN、Infinity、-Infinity、字符串(JSON转换)
│   └── 负数 -1 行为验证（容错为 0 或抛 401）
├── 返回值与类型验证
│   ├── 构造后所有位默认为 0
│   ├── instanceof collections.BitVector / typeof === "object"
│   └── cap 边界构造后 setAllBits/push/resize 跨 word 正确
├── 组合场景
│   ├── constructor + setAllBits(1)/(0) 验证全置位/清零
│   ├── constructor + push 跨 word 边界
│   └── constructor + resize 跨 word 边界
└── 非二进制值：-1/2/65535 经构造+setAllBits 验证存储为 1
```

- **用例位置**：专用文件 `BitVectorConstructor.test.ets`（31 例）+ 综合套件 `BitVectorTest.test.ets`（1 例：7300）
- **测了哪些**：正常数值/0/大长度构造、cap 边界构造、浮点/NaN/Inf/-Inf/字符串抛 401、负数 -1 容错、instanceof/typeof、构造+setAllBits/push/resize 组合、非二进制值存储。共 31（专用）+ 1（综合）。

---

## 1.2 length（只读属性）

```
length
├── 入参范围覆盖：构造后=初始值；push 后 +1；pop 后 -1；resize 后=新值
├── 边界值测试：length=0(空)/1(单元素)/64/128/1024(word 边界)
├── 异常与非法输入：readonly 无入参（不适用）
├── 返回值与类型验证：类型为 number
└── 组合场景：push/pop/resize 交替后 length 变化链
```

- **用例位置**：无独立文件，贯穿各接口专用文件（length 断言）
- **测了哪些**：构造/增删/resize 后 length 一致性、number 类型、0/1/word 边界 length。无独立用例，作为各接口断言贯穿全链。

---

## 1.3 push(element: number): boolean

```
push
├── 入参范围覆盖
│   ├── 0 → 存储位 0；1 → 存储位 1
│   ├── 非零值 2/-1/65535/-65535/MAX_SAFE_INTEGER/MIN_SAFE_INTEGER → 均存储为 1
│   └── 浮点 2.5/0.5/-0.5 → 均存储为 1
├── 边界值测试
│   ├── 空 BV push(1) → length=1、值=1
│   ├── 64 边界：push 64 个 / push 65 个跨 word
│   ├── 128 边界：push 128 / 129 跨边界
│   └── 1024 边界：push 1024 / 1025 跨边界
├── 异常与非法输入
│   ├── NaN / Infinity 入参（length 仍增长，位值按非零=1）
│   └── 解绑 10200011：解绑 push 调用
├── 返回值与类型验证
│   ├── 返回 boolean，成功 true
│   └── 额外参数被忽略，length=1
├── 组合场景
│   ├── push+pop+resize length 联动
│   ├── push 1000 次 0/1 交替 → length=2000
│   └── push 非 0/1 值 + getBitCountByRange 验证
└── 重复调用：重复 push 10 次验证 length 与值
```

- **用例位置**：专用文件 `BitVectorPush.test.ets`（43 例）
- **测了哪些**：0/1/非零/浮点值存储、空/64/128/1024 边界、NaN/Infinity、解绑 10200011、返回 boolean、push+pop+resize 组合、1000 次交替、重复 push。共 43（专用）。

---

## 1.4 pop(): number

```
pop
├── 入参范围覆盖
│   ├── 连续 pop 返回 LIFO 顺序（0/1）
│   └── pop 64 次 / 10000 次返回对应位值
├── 边界值测试
│   ├── 空 BV pop → 返回 undefined
│   ├── 单元素 pop 后变空，再 pop 返回 undefined
│   └── pop 至空后再 push 验证
├── 异常与非法输入：解绑 10200011（解绑 pop 调用）
├── 返回值与类型验证：number；无参/额外参数被忽略
├── 组合场景
│   ├── 交替 push/pop 操作
│   ├── pop 后索引访问验证
│   ├── pop 后迭代器遍历验证
│   └── pop 后再 push
└── 重复调用：重复 pop 5 次至空
```

- **用例位置**：专用文件 `BitVectorPop.test.ets`（27 例）
- **测了哪些**：LIFO 顺序、空 pop undefined、单元素/空后 push、解绑 10200011、number 返回、pop 后索引/迭代/再 push 组合、重复 pop。共 27（专用）。

---

## 1.5 has(element, fromIndex, toIndex): boolean

```
has
├── 入参范围覆盖
│   ├── 查 0 / 查 1 / 查非零值 2，范围内存在→true、不存在→false
│   └── 多值多范围组合查询
├── 边界值测试
│   ├── 首元素 (from=0,to=1) 存在/不存在
│   ├── 末尾元素 (from=length-1,to=length) 存在/不存在
│   ├── toIndex=length（合法边界）元素存在 true / 不存在 false
│   ├── 单元素 BV、大 BV(100) 全范围
│   └── 64 边界：跨 64 边界 has(范围 60-65)
├── 异常与非法输入
│   ├── 类型错误 401：浮点索引(0.1,6.1/1.5,3.5)、NaN、Infinity
│   ├── 范围错误 10200001：fromIndex=-1/-3、toIndex=超长度(17)、fromIndex>toIndex、fromIndex=toIndex
│   ├── 空 BV has(0,0,0) → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：boolean
├── 组合场景：setBitsByRange 后 has 验证范围内外
└── 模式覆盖（PatternBoundary）：全 0 / 全 1 / 全 -1(按1) / 全 2(按1) / 0,1交替 / 1,0交替 / 全0中单1 / 全1中单0
```

- **用例位置**：专用文件 `BitVectorHas.test.ets`（54 例）
- **测了哪些**：0/1/非零值查询、首末/toIndex=length 边界、64 边界、401/10200001/10200011 异常、空 BV、boolean 返回、setBitsByRange+has 组合、8 种模式覆盖。
> 注：旧版 6 个对称模式注释用例（全1/全-1/全2 查0返回false）已从代码删除，对称覆盖由全0与交替模式补足。

---

## 1.6 setBitsByRange(element, fromIndex, toIndex): void

```
setBitsByRange
├── 入参范围覆盖
│   ├── 范围内置 1 / 置 0，验证位值变化
│   ├── 元素 0 与非零值 2 设置（非零→1）
│   └── 大范围(100 元素)设置
├── 边界值测试
│   ├── 全范围 from=0,to=length
│   ├── 仅末尾 from=length-1
│   ├── 仅首元素 from=0,to=1
│   ├── 单元素全范围
│   └── 64/128/1024 边界：跨边界设置 + flipBitsByRange 联动
├── 异常与非法输入
│   ├── 类型错误 401：字符串 fromIndex、NaN
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17)、from>to、from=to(8=8)、toIndex=3 超 length=2
│   ├── 空 BV setBitsByRange(1,0,0) → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：void(undefined)
├── 组合场景：setBitsByRange + has 范围内外验证
├── 重复调用：3 次不同范围重复设置
└── 非二进制值：-1/2/65535 经 setBitsByRange 验证存储为 1
```

- **用例位置**：专用文件 `BitVectorSetBitsByRange.test.ets`（49 例）
- **测了哪些**：置0/1/非零值、全/首/末/单元素范围、64/128/1024 边界、401/10200001/10200011、空 BV、void 返回、+has 组合、重复设置、非二进制值。共 49（专用）。

---

## 1.7 setAllBits(element): void

```
setAllBits
├── 入参范围覆盖
│   ├── set(0) 全 0；set(1) 全 1；set(2/-1/65535/-65535) 全 1（非零→1）
│   └── set(2.5) 浮点全 1
├── 边界值测试
│   ├── 空 BV setAllBits，length 保持 0
│   ├── 单元素 BV setAllBits
│   ├── 64 边界：恰好 64 元素 setAllBits
│   └── 128/1024 边界：setAllBits + values() 迭代 / flip 联动
├── 异常与非法输入：解绑 10200011
├── 返回值与类型验证：void(undefined)
├── 组合场景：set(1)→set(0) 往复；flip + setAllBits 在边界
└── 重复调用：3 次 0→1→0→1 往复
```

- **用例位置**：专用文件 `BitVectorSetAllBits.test.ets`（26 例）
- **测了哪些**：0/1/非零/浮点全置、空/单元素/64/128/1024 边界、解绑 10200011、void 返回、往复组合、重复调用。共 26（专用）。

---

## 1.8 getBitsByRange(fromIndex, toIndex): BitVector

```
getBitsByRange
├── 入参范围覆盖
│   ├── 正常范围返回子向量，length 与值正确
│   └── 大范围(100 元素)获取
├── 边界值测试
│   ├── 全范围 from=0,to=length
│   ├── 仅末尾 from=length-1
│   ├── 仅首元素 from=0,to=1
│   ├── 单元素全范围
│   ├── 64/128 边界：跨边界获取(范围 60-65 / 125-129)
│   └── toIndex=length 合法边界
├── 异常与非法输入
│   ├── 类型错误 401：字符串 toIndex、NaN fromIndex/toIndex
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17/11)、from>to、from=to
│   ├── 空 BV getBitsByRange(0,0) → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证
│   └── 返回新 BitVector 实例（instanceof、!== 原 bv）
└── 组合场景：getBitsByRange + setAllBits 联动
```

- **用例位置**：专用文件 `BitVectorGetBitsByRange.test.ets`（50 例）
- **测了哪些**：正常/大范围获取、全/首/末/单元素/64/128 边界、401/10200001/10200011、空 BV、新实例 instanceof+!==、+setAllBits 组合。共 50（专用）。

---

## 1.9 getBitCountByRange(element, fromIndex, toIndex): number

```
getBitCountByRange
├── 入参范围覆盖
│   ├── 统计 0 / 1 / 非零值 2 个数（非零按 1 计）
│   ├── 不同子范围统计
│   └── 全范围统计返回 number
├── 边界值测试
│   ├── 全范围 toIndex=length
│   ├── 末尾 from=length-1
│   ├── 首元素 from=0,to=1
│   ├── 单元素 BV
│   ├── 全 0 统计 1=0；全 1 统计 0=0
│   ├── 64/128/1024 边界：跨边界统计(范围 60-65 / 125-129 / 1020-1025)
│   └── 容器规格 size=1/2/100 全范围
├── 异常与非法输入
│   ├── 类型错误 401：NaN toIndex、fromIndex=Infinity/toIndex=Infinity、字符串 toIndex
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17/11)、from>to、from=to
│   ├── 空 BV 统计 → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：number
├── 组合场景：getBitCountByRange + has / getBitsByRange 联动
└── 模式覆盖：全 0 / 全 1 / 全 -1(按1) / 全 2(按1) / 0,1交替 / 全0中单1 / 全1中单0
```

- **用例位置**：专用文件 `BitVectorGetBitCountByRange.test.ets`（57 例）
- **测了哪些**：0/1/非零值统计、子范围、全/首/末/单元素/64/128/1024 边界、容器规格、401/10200001/10200011、空 BV、number 返回、+has/getBitsByRange 组合、7 种模式。共 57（专用）。

---

## 1.10 resize(size): void

```
resize
├── 入参范围覆盖
│   ├── 扩容(size>length)，新增位为 0
│   ├── 缩容(size<length)，截断
│   ├── resize 到相同 size，数据不变
│   └── 大尺寸 100000 扩容
├── 边界值测试
│   ├── resize(0) 清空
│   ├── 空 BV resize(0)，length 保持 0
│   ├── 空 BV resize(1/64)（已知问题用例）
│   ├── 变空后(pop) resize(1)
│   ├── 64/128/1024 边界：64↔65、128↔129、1024↔1025 扩/缩跨 word
│   └── 扩容后原数据保留
├── 异常与非法输入
│   ├── 类型错误 401：NaN、Infinity
│   ├── 范围错误 10200001：size=-1
│   └── 解绑 10200011（隐含）
├── 返回值与类型验证：void(undefined)
├── 组合场景：扩容→缩容→扩容 length 与数据联动
├── 重复调用：扩→缩→扩 往复
└── 并发跨线程：testBitVectorResize10200201（跨线程并发修改抛 10200201）
```

- **用例位置**：专用文件 `BitVectorResize.test.ets`（48 例，含 `testBitVectorResize10200201` 跨线程并发）+ 综合套件 `BitVectorTest.test.ets`（5 例：4300–4700）
- **测了哪些**：扩/缩/同 size、resize(0)/空 resize/变空后 resize、64/128/1024 边界、原数据保留、401(NaN/Inf)/10200001(size=-1)、void 返回、扩缩组合、重复、跨线程 10200201。
> 注：旧版 5 个综合/空 resize 注释用例已从代码删除。

---

## 1.11 getIndexOf(element, fromIndex, toIndex): number

```
getIndexOf
├── 入参范围覆盖
│   ├── 查 0 / 查 1 第一次出现位置
│   ├── 非零值 2 查找 → 返回第一个 1 位置
│   ├── 负数 -1 查找 → 返回第一个 1 位置
│   └── 指定范围查找，未找到返回 -1
├── 边界值测试
│   ├── 全范围未找到返回 -1
│   ├── 末尾元素 from=length-1
│   ├── 首元素 from=0,to=1
│   ├── 全 0 查 1 返回 -1；全 1 查 0 返回 -1
│   ├── 单元素 BV 查找
│   ├── 大 BV(100) 查找
│   └── 64 边界跨 word 查找
├── 异常与非法输入
│   ├── 类型错误 401：浮点索引(0.1,6.1)、NaN fromIndex/toIndex
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17/11)、from>to、from=to
│   ├── 空 BV getIndexOf → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：number
└── 模式覆盖：全 0 / 全 1 / 全 -1(按1) / 全 2(按1) / 0,1交替(0→0,1→1) / 全0中单1(→9)
```

- **用例位置**：专用文件 `BitVectorGetIndexOf.test.ets`（44 例）
- **测了哪些**：0/1/非零/负数首查、未找到 -1、首末/全0全1/单元素/大BV/64边界、401/10200001/10200011、空 BV、number 返回、6 种模式。共 44（专用）。

---

## 1.12 getLastIndexOf(element, fromIndex, toIndex): number

```
getLastIndexOf
├── 入参范围覆盖
│   ├── 查 0 / 查 1 最后出现位置
│   ├── 非零值 2 / 负数 -1 查找 → 最后 1 位置
│   └── 未找到返回 -1
├── 边界值测试
│   ├── 全范围未找到返回 -1
│   ├── 末尾元素 from=length-1
│   ├── 首元素 from=0,to=1
│   ├── 全 0 查 1 返回 -1；全 1 查 0 返回 -1
│   ├── 单元素 BV / 大 BV(100) 查找（0 最后位置=98）
│   └── 64 边界跨 word 查找
├── 异常与非法输入
│   ├── 类型错误 401：浮点索引(0.1,6.1)、NaN fromIndex/toIndex、Infinity
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17/11)、from>to、from=to
│   ├── 空 BV getLastIndexOf → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：number
├── 组合场景：getIndexOf(首) vs getLastIndexOf(末) 对比
└── 模式覆盖：全 0 / 全 1 / 全 -1(按1) / 全 2(按1) / 0,1交替(1→9,0→8) / 全1中单0(0→9)
```

- **用例位置**：专用文件 `BitVectorGetLastIndexOf.test.ets`（43 例）
- **测了哪些**：0/1/非零/负数末查、未找到 -1、首末/全0全1/单元素/大BV/64边界、401/10200001/10200011、空 BV、number 返回、首末对比组合、6 种模式。共 43（专用）。

---

## 1.13 flipBitByIndex(index): void

```
flipBitByIndex
├── 入参范围覆盖
│   ├── 0→1 翻转、1→0 翻转
│   └── 二次翻转恢复原值
├── 边界值测试
│   ├── 首元素 index=0
│   ├── 末尾元素 index=length-1
│   ├── 单元素 index=0 二次翻转恢复
│   ├── 64/128/1024 边界：边界索引 63/64、127/128/129、1023 翻转
│   └── 全 64 元素翻转 / 74 元素翻转(索引 10-73)
├── 异常与非法输入
│   ├── 类型错误 401：浮点 index(6.1/5.5)、NaN、Infinity、字符串 index
│   ├── 范围错误 10200001：index=-1/-2、index=20/16/=length 超范围
│   ├── 空 BV 翻转 → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：void(undefined)
└── 并发跨线程：跨线程翻转抛 10200201（SUB_COLLECTIONS_BITVECTOR_05200）
```

- **用例位置**：专用文件 `BitVectorFlipBitByIndex.test.ets`（35 例，含 `SUB_COLLECTIONS_BITVECTOR_05200` 跨线程并发）
- **测了哪些**：0↔1 翻转、二次翻转恢复、首末/单元素/64/128/1024 边界、401/10200001/10200011、空 BV、void 返回、跨线程 10200201。共 35（专用）。

---

## 1.14 flipBitsByRange(fromIndex, toIndex): void

```
flipBitsByRange
├── 入参范围覆盖
│   ├── 范围内 0→1、1→0 翻转
│   ├── 全范围翻转 / 单元素范围翻转
│   ├── 范围外元素不变
│   └── 二次翻转恢复原值
├── 边界值测试
│   ├── 全范围 from=0,to=length
│   ├── 仅末尾 from=length-1
│   ├── 仅首元素 from=0,to=1
│   ├── 单元素 BV 全范围翻转
│   ├── 64/128 边界：跨边界翻转(范围 60-65 / 125-129)
│   └── 大 BV(100) 翻转
├── 异常与非法输入
│   ├── 类型错误 401：浮点 fromIndex(3.11)、NaN fromIndex/toIndex、Infinity、字符串 toIndex
│   ├── 范围错误 10200001：from=-1/-3、to=超长度(17/11)、from>to、from=to
│   ├── 空 BV 翻转 → 10200001
│   └── 解绑 10200011
├── 返回值与类型验证：void(undefined)；翻转后 length 不变
├── 组合场景：setBitsByRange 后 flip 再 has 验证；flip + setAllBits
├── 重复调用：两次同范围翻转恢复原值
├── 进制索引：十六进制(0x1A,0x1E)、八进制(0o12,0o15) 索引翻转
└── 并发跨线程：跨线程翻转抛 10200201（SUB_COLLECTIONS_BITVECTOR_05300）
```

- **用例位置**：专用文件 `BitVectorFlipBitsByRange.test.ets`（46 例，含 `SUB_COLLECTIONS_BITVECTOR_05300` 跨线程并发）
- **测了哪些**：0↔1 翻转、全/首/末/单元素/64/128/大BV 边界、401/10200001/10200011、空 BV、void+length不变、+setBitsByRange/setAllBits 组合、重复翻转、进制索引、跨线程 10200201。共 46（专用）。

---

## 1.15 values() / [Symbol.iterator]()

```
values / [Symbol.iterator]
├── 入参范围覆盖
│   ├── for...of 遍历 / while 循环迭代
│   ├── next() 逐个获取
│   ├── 展开运算符 ... 转数组 / Array.from 转换
│   ├── 部分迭代(前 N 个) / 解构赋值 / break 提前终止
│   └── 迭代顺序 head→tail 验证
├── 边界值测试
│   ├── 空 BV 迭代器立即 done
│   ├── 单元素迭代器
│   ├── 全 0 迭代 / 全 1 迭代
│   ├── 大 BV(1000/100) 迭代
│   └── 64 边界：values() + pop(65→64)
├── 异常与非法输入：解绑 10200011（values）
├── 返回值与类型验证：function(迭代器) / value 为 number(0 或 1) / done 状态
├── 组合场景
│   ├── 多迭代器独立性
│   ├── 迭代器耗尽后 done
│   ├── flipBitsByRange 后重新迭代
│   ├── pop 后迭代
│   └── [Symbol.iterator] 与 values() 比较
└── 并发跨线程：跨线程 values 抛 10200201（SUB_COLLECTIONS_BITVECTOR_05400）
```

- **用例位置**：专用文件 `BitVectorValues.test.ets`（44 例，含 13 例 `[Symbol.iterator]` Iterator 系列 + values 系列 + `SUB_COLLECTIONS_BITVECTOR_05400` 跨线程）+ 综合套件 `BitVectorTest.test.ets`（2 例：6400–6500）
- **测了哪些**：for...of/while/next/.../Array.from/部分迭代/解构/break、空/单元素/全0全1/大BV/64 边界、解绑 10200011、迭代器类型+number value+done、多迭代器独立性/耗尽/flip后/pop后/与values比较组合、跨线程 10200201。共 44（专用）+ 2（综合）。

---

## 1.16 [index: number] 索引访问器（get/set）

```
[index] 访问器
├── 入参范围覆盖
│   ├── get 返回正确位值（0/1）
│   ├── set 赋值 0/1
│   └── 多索引访问
├── 边界值测试
│   ├── 首元素 index=0
│   ├── 末尾元素 index=length-1
│   ├── 单元素 index=0 / index=1 超范围
│   ├── 构造初始 length 的索引访问
│   └── 64 边界：边界索引 63/64/65 超范围
├── 异常与非法输入
│   ├── 范围错误 10200001：index=length 超范围、大索引 100000、负索引 -1、空 BV [0]
│   └── 非整数索引返回 undefined：字符串 index、NaN、Infinity、浮点 1.5
├── 返回值与类型验证：number
└── 组合场景：set 后 get 一致；flip/get 联动
```

- **用例位置**：专用文件 `BitVectorIndexAccess.test.ets`（22 例）
- **测了哪些**：get/set 0/1、多索引、首末/单元素/构造初始length/64 边界、10200001(超范围/大索引/负/空)、非整数索引 undefined、number 返回、set+get/flip+get 组合。共 22（专用）。

---

# 2. 稳定性（Stability）

```
稳定性
├── 长时重复
│   ├── 重复 push 10 次 / 重复 pop 5 次 / 重复 setBitsByRange 3 次 / 重复 setAllBits 3 次 / 重复 flipBitsByRange 2 次
│   └── 扩→缩→扩 resize 往复
├── 大规模数据
│   ├── 构造 length=1000000
│   ├── push 1000 次交替 → length=2000
│   ├── resize 100000 扩容
│   ├── 大 BV(1000) values 迭代 / 大 BV(100) getBitCountByRange
│   └── 容器规格 size=10000 全范围（综合套件）
├── 资源释放：afterAll sleep(100) 确保上一用例资源释放
├── 边界跨 word 反复：64/128/1024 边界扩缩/设置/翻转/获取反复不崩溃
└── 空容器操作：空 BV 各只读/写接口不崩溃（已知问题用例标注）
```

- **用例位置**：分散于各专用文件（`testBitVectorRepeatCall*` / `testBitVectorEmptyResizeBoundary*` / 各 `*Boundary*` 系列）+ 综合套件 `BitVectorTest.test.ets`
- **测了哪些**：5 类重复调用、扩缩往复、1000000 构造、1000 次交替 push、100000 resize、大 BV 迭代/统计、size=10000 全范围、资源释放、跨 word 反复、空容器不崩溃。

---

# 3. 性能（Performance）

```
性能
├── 大规模构造时延：length=1000000 构造
├── 大规模写入：push 1000 次交替 / setBitsByRange 大范围 100 / setAllBits 大 BV 1000
├── 大规模查询：getBitCountByRange 大 BV / getBitsByRange 大 BV
├── 大规模迭代：values 大 BV 1000 / [Symbol.iterator] 100
└── 100 并发吞吐：ConcurrentSingle/Multi 100 任务 TaskPool/TaskGroup（见 §4）
```

- **用例位置**：复用 §2 大规模用例 + §4 100 并发用例
- **测了哪些**：大规模构造/写入/查询/迭代不崩溃+结果正确、100 并发吞吐。
> 现状：性能以"大规模不崩溃 + 结果正确"为隐式验证，**无显式时延/吞吐阈值**（见 §7 缺口4）。

---

# 4. 并发安全（Concurrency Safety）

```
并发安全
├── Sendable 跨线程读写（BitVectorUnbound.test.ets，31 用例）
│   ├── 跨线程读取：length / [index] / has / getBitCountByRange / getIndexOf / values 求和
│   ├── 跨线程写入后主线程可见：push / setAllBits / setBitsByRange / flipBitsByRange / resize
│   ├── Worker 创建 BV 返回主线程 / Worker 创建并填充 / Worker getBitsByRange 返回
│   ├── Worker 创建 → 主线程操作（push/has/setBitsByRange）
│   └── 边界：单元素全操作 / 空 push / 大 BV(1000) 边界操作 / 超范围错误传播 / 多 BV 操作
├── 100 并发 TaskPool 单任务（BitVectorConcurrentSingle，8 用例）
│   └── pop / has / getBitsByRange / getBitCountByRange / getIndexOf / getLastIndexOf / [index] / flipBitsByRange+values
├── 100 并发 TaskGroup 多任务（BitVectorConcurrentMulti，7 用例）
│   └── push / setBitsByRange / setAllBits / resize / flipBitByIndex / SendableClass 传递 / SendableClass+AsyncLock
├── 并发错误码 10200201（跨线程写）
│   ├── flipBitByIndex 跨线程（SUB_COLLECTIONS_BITVECTOR_05200）
│   ├── flipBitsByRange 跨线程（SUB_COLLECTIONS_BITVECTOR_05300）
│   ├── values 跨线程（SUB_COLLECTIONS_BITVECTOR_05400）
│   └── resize 跨线程（testBitVectorResize10200201）
├── AsyncLock 序列化：10 轮全接口 + AsyncLock（Unbound _4780）
├── 全接口 try-catch 并发：10 轮主线程+TaskPool 同时调用（Unbound _4770）
└── 综合套件并发（BitVectorTest 6900~7100）：countBitsFunc 跨线程统计 / modifyBitVector 跨线程修改 / concurrentPush 多任务+AsyncLock
```

- **用例位置**：`BitVectorUnbound.test.ets`（31 例）+ `BitVectorConcurrentSingle.test.ets`（8 例）+ `BitVectorConcurrentMulti.test.ets`（7 例）+ 综合套件 `BitVectorTest.test.ets`（6900–7100）+ 各专用文件内的 10200201 用例（flip/flipBits/values/resize）
- **测了哪些**：跨线程读/写可见性、Worker 创建/填充/返回、单元素/空/大BV 边界、100 并发 TaskPool/TaskGroup、4 处 10200201、AsyncLock 序列化、全接口 try-catch 并发、综合套件并发 push/统计/修改。

---

# 5. 兼容性与继承（Compatibility & Inheritance）

```
兼容性与继承
├── 类型校验
│   ├── instanceof collections.BitVector
│   └── typeof === "object"
├── @Sendable 子类继承
│   ├── 自定义 MyBitVector extends collections.BitVector，super(length) 构造
│   ├── 子类扩展方法 countOnes() 调用父类 getBitCountByRange
│   └── 子类实例 instanceof collections.BitVector
├── SendableClass 传递：BitVector 作为 @Sendable class 字段传递到 Worker
└── 跨套件一致性：综合套件 BitVectorTest 与各专用文件场景对齐验证
```

- **用例位置**：`BitVectorConstructor.test.ets`（`_1080` instanceof/typeof）+ `BitVectorConcurrentMulti.test.ets`（`CollectionsTestClass001/002` SendableClass）+ 综合套件 `BitVectorTest.test.ets`（7200 子类继承 / 7300 instanceof/typeof）
- **测了哪些**：instanceof/typeof、@Sendable 子类 MyBitVector + countOnes()、SendableClass 传递、跨套件一致性。

---

# 6. 资料与文档符合性（Doc Conformance）

> 依据 `@arkts.collections.d.ets` BitVector 声明的 JSDoc 契约，逐条核对测试是否覆盖。

| 契约项 | 文档要求 | 测试覆盖 | 状态 |
|--------|---------|---------|:---:|
| constructor(length) | length 为 number | 0/正常/大数/浮点/NaN/Inf/-Inf/负数 | ✅ |
| length 只读 | readonly number | 构造/增删/resize 后断言 | ✅ |
| push 返回 boolean | true 成功 / false 失败原因(必填缺失/类型错) | true 验证；**false 失败路径未显式覆盖** | ⚠️ |
| push throws 10200011 | 方法不可绑定 | 解绑用例 | ✅ |
| push throws 10200201 | 并发修改 | 综合套件 concurrentPush | ✅ |
| pop 返回 number | 末元素 | LIFO/number | ✅ |
| pop throws 10200011/10200201 | — | 解绑 ✅ / 并发待补 | ⚠️ |
| has 返回 boolean | 范围内存在性 | ✅ | ✅ |
| has throws 10200001 | from/to 越界 | 负/超长/from>to/from=to 全覆盖 | ✅ |
| setBitsByRange 返回 void | — | undefined 验证 | ✅ |
| setAllBits 返回 void | — | undefined 验证 | ✅ |
| getBitsByRange 返回 BitVector | 新实例 | instanceof + !==原 | ✅ |
| resize 返回 void | — | undefined 验证 | ✅ |
| getBitCountByRange 返回 number | 个数 | number + 值 | ✅ |
| getIndexOf 返回 number | first索引/-1 | ✅ | ✅ |
| getLastIndexOf 返回 number | 末次索引/-1 | ✅ | ✅ |
| flipBitByIndex 返回 void | — | undefined | ✅ |
| flipBitsByRange 返回 void | — | undefined | ✅ |
| [Symbol.iterator] throws 10200011 | 不可绑定 | 解绑覆盖于 values/通用解绑 | ✅ |
| values throws 10200011/10200201 | — | 解绑 ✅ / 并发 ✅ | ✅ |
| [index] get/set | number | get/set 一致 | ✅ |
| fromIndex 语义（inclusive） | — | 首元素/包含验证 | ✅ |
| toIndex 语义（exclusive） | — | 末尾 to=length/排除验证 | ✅ |

---

# 7. 覆盖度矩阵与缺口分析

## 7.1 接口 × 测试逻辑分类 覆盖矩阵

| 接口 | 入参范围 | 边界值 | 异常输入 | 返回值类型 | 组合场景 | 重复调用 | 并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅ | ✅ | ✅401 | ✅instanceof | ✅ | — | ✅(Worker创建) |
| length | ✅ | ✅ | n/a | ✅number | ✅ | — | ✅ |
| push | ✅ | ✅ | ✅401/10200011 | ✅boolean | ✅ | ✅ | ✅10200201 |
| pop | ✅ | ✅ | ✅10200011 | ✅number | ✅ | ✅ | ⚠️ |
| has | ✅ | ✅ | ✅401/10200001/10200011 | ✅boolean | ✅ | — | ✅ |
| setBitsByRange | ✅ | ✅ | ✅401/10200001/10200011 | ✅void | ✅ | ✅ | ✅10200201 |
| setAllBits | ✅ | ✅ | ✅10200011 | ✅void | ✅ | ✅ | ✅10200201 |
| getBitsByRange | ✅ | ✅ | ✅401/10200001/10200011 | ✅BitVector | ✅ | — | ⚠️ |
| getBitCountByRange | ✅ | ✅ | ✅401/10200001/10200011 | ✅number | ✅ | — | ✅ |
| resize | ✅ | ✅ | ✅401/10200001 | ✅void | ✅ | ✅ | ✅10200201 |
| getIndexOf | ✅ | ✅ | ✅401/10200001/10200011 | ✅number | ✅ | — | ✅ |
| getLastIndexOf | ✅ | ✅ | ✅401/10200001/10200011 | ✅number | ✅ | — | ✅ |
| flipBitByIndex | ✅ | ✅ | ✅401/10200001/10200011 | ✅void | ✅ | ✅(二次翻转) | ✅10200201 |
| flipBitsByRange | ✅ | ✅ | ✅401/10200001/10200011 | ✅void | ✅ | ✅ | ✅10200201 |
| values/[Symbol.iterator] | ✅ | ✅ | ✅10200011 | ✅iter/number | ✅ | — | ✅10200201 |
| [index] | ✅ | ✅ | ✅10200001 | ✅number | ✅ | — | ✅ |

## 7.2 逐接口遗漏确认（对照 `arkts-apis-arkts-collections-BitVector.md` 与 `@arkts.collections.d.ets`）

> 逐接口核对文档/声明契约与现有用例，标注：✅ 已覆盖 / ❌ 测试遗漏 / ⚠️ 文档遗漏(已测未文档化) / 🔴 产品缺陷。

| 接口 | 契约要点 | 核查结论 |
|------|---------|---------|
| constructor(length) | length:number 必填 | ✅ 0/正常/大数/cap边界/instanceof 已测。❌ **未测** `new BitVector()` 缺参行为。⚠️ NaN/Infinity/-Infinity/浮点→401、负数容错/401 **已测但 .md 无错误码表、.d.ets 无 @throws**，建议文档补 401 行。 |
| length | readonly number | ✅ 贯穿各接口断言。无明显遗漏。 |
| push(element) | 返回 boolean；true 成功/false 失败(必填缺失·类型错)；10200011/10200201 | ✅ true 路径/值存储/边界/NaN·Inf/解绑10200011/并发10200201 已测。🔴 **未测 false 返回路径**：文档明示"失败返回 false(必填参数缺失/参数类型错误)"，缺 `push()`、`push(undefined)`、`push("1")` 等→false 的断言。这是明确契约缺口。 |
| pop() | 返回 number；10200011/10200201 | ✅ LIFO/空pop/单元素/解绑10200011 已测。❌ **未测 pop 跨线程并发 10200201**（flip/resize/values/flipBits 均有独立跨线程用例，pop 无）。⚠️ 空 BV pop 返回 undefined（非 number），文档未定义空 pop 行为，建议补充说明。 |
| has(el,from,to) | 返回 boolean；10200001/10200011/10200201 | ✅ 覆盖充分（含 8 种模式）。对称模式删除后由全0+交替补足，可接受。❌ **未测** `has()` 缺参(0/1/2 参)→401。⚠️ 浮点/NaN/Inf/字符串索引→401 已测但 .md 错误码表未列 401。 |
| setBitsByRange(el,from,to) | void；10200001/10200011/10200201 | ✅ 充分。❌ **未测** 缺参(只传 element)→401。⚠️ 401 已测未文档化。 |
| setAllBits(el) | void；10200011/10200201 | ✅ 充分。❌ **未测** `setAllBits()` 无参→401。⚠️ 401 已测未文档化。 |
| getBitsByRange(from,to) | 返回 BitVector 新实例；10200001/10200011/10200201 | ✅ 单接口覆盖充分。🔴 **组合缺口**：返回值仅校验 length/value/instanceof/!==原，**从未对其继续调用任何接口**（见 §7.3-1）。⚠️ 401 已测未文档化。 |
| getBitCountByRange(el,from,to) | 返回 number；10200001/10200011/10200201 | ✅ 充分（7 模式）。⚠️ 401 已测未文档化。 |
| resize(size) | void；size>原长扩充补0，size≤原长裁剪；10200011/10200201 | ✅ 扩/缩/同size/resize(0)/64·128·1024边界/原数据保留/NaN·Inf→401/size=-1→10200001/跨线程10200201 已测。❌ **未测 缩容后访问被截断旧索引应抛 10200001**（`testBitVectorResize0003` 仅查 length/[0]）。❌ **未测 扩容后对新零区查询**(has/getBitCountByRange/getIndexOf on expanded region)。✅ **空容器 resize 已修复为正常场景**：`new BitVector(0).resize(正数)` 现可正常扩容补 0。但现有 4 用例(`testBitVectorEmptyResizeBoundary0001~0004`)为**容错写法(try/catch 容忍旧 bug，catch 断言 10200001)**，产品已修复后走成功分支通过，却**无法防回归**；且 `@tc.desc` 仍标"known issue: throws 10200001"已过时、0003 仅查 length 未查 64 位全 0。建议转严格正向断言。❌ **未覆盖**：空容器跨 word 扩容(resize 65/128/129/1024/1025)、扩容后查询(has/getBitCountByRange/getIndexOf/getBitsByRange/values)、扩容后写操作(push/flip/setBits)、大尺寸空扩容(resize 100000)、多种变空方式后 resize-up。详见补充设计 E 组。⚠️ resize 的 401 与 10200001 在 .md/.d.ets 错误码表均未列(仅10200011/10200201)，均已测未文档化。 |
| getIndexOf(el,from,to) | 返回 number/-1；10200001/10200011/10200201 | ✅ 充分（6 模式）。⚠️ 401 已测未文档化。 |
| getLastIndexOf(el,from,to) | 返回 number/-1；10200001/10200011/10200201 | ✅ 充分（6 模式）。⚠️ 401 已测未文档化。 |
| flipBitByIndex(index) | void；10200001/10200011/10200201 | ✅ 充分。⚠️ 401(浮点/NaN/Inf/字符串 index) 已测但 .md 错误码表未列。 |
| flipBitsByRange(from,to) | void；10200001/10200011/10200201 | ✅ 充分。⚠️ 401 已测未文档化。 |
| values() | 返回迭代器；10200011/10200201 | ✅ 充分。✅ 同线程迭代中 push 修改已测(`testBitVectorIterator0010`)。✅ 跨线程 10200201 已测。 |
| [Symbol.iterator]() | 文档明确"**不支持在.ets文件中使用**" | ⚠️ **契约/测试失配**：13 个标为 [Symbol.iterator] 的用例**实际通过 `values()` 取迭代器**，仅 1 例(`testBitVectorIterator0004`)用 `for...of` 隐式触发。**直接调用 `bv[Symbol.iterator]()` 在 .ets 的行为未测**（按文档应不可用）。建议更正用例标注，并明确该接口在 .ets 的可用边界。 |
| [index:number] | 返回 number；index<0 或 >=length 抛错 | ✅ get/set/边界/超范围10200001/空BV/64边界 已测。⚠️ 契约偏差：非数值索引(字符串/NaN/Infinity/浮点) **返回 undefined 而非抛错**；文档仅说 index<0 或 >=length 抛错，NaN 既不<0 也不>=length(比较为 false)故静默返回 undefined，该边界文档未定义。 |

## 7.3 接口组合遗漏（从组合角度核查）

1. 🔴 **getBitsByRange 返回的新 BitVector 未做"可继续操作"验证**：返回子向量仅校验 length/value/instanceof/!==原，**从未对其调用 push/pop/setBitsByRange/flipBitByIndex/flipBitsByRange/getBitCountByRange/has/getIndexOf/resize/values**。应补：对子向量执行各读写接口，验证它是功能完整、独立的 BitVector 副本（修改子向量不影响原 BV）。
2. 🔴 **resize 缩容后旧索引/旧范围操作未测**：缩容→`[oldIndex]`、`has(.,0,oldLength)`、`getIndexOf(.,0,oldLength)`、`getBitCountByRange(.,0,oldLength)`、`getBitsByRange(oldIndex,oldLength)` 应一致抛 10200001。当前缩容用例仅查 length/首元素。
3. ❌ **resize 扩容后新零区查询未测**：扩容→`has(0,oldLen,newLen)=true`、`getBitCountByRange(0,oldLen,newLen)=增量`、`getIndexOf(0,oldLen,newLen)=oldLen`。当前扩容用例仅查 length/新位=0。
4. ⚠️ **flipBitByIndex 与 getIndexOf/has 联动未专项测**：flip 后 getIndexOf/has 反映翻转结果——综合套件有 setBitsByRange+flip+has(`4970`)，但 flipBitByIndex+getIndexOf 专项组合未测。
5. ⚠️ **多层子向量组合未测**：setAllBits 后 getBitsByRange 取子向量，再对该子向量 setAllBits/flip/setBitsByRange；以及跨 word 边界子向量再跨边界操作。
6. ✅ **已覆盖的组合**：push/pop/resize length 联动、同线程迭代中修改、跨线程读写可见性、setBitsByRange+has 范围内外、getIndexOf(首) vs getLastIndexOf(末) 对比、综合套件全接口串联。

## 7.4 文档与测试一致性建议（同步给资料侧）

- **多接口 .md 错误码表缺 401 行**：has/setBitsByRange/setAllBits/getBitsByRange/getBitCountByRange/getIndexOf/getLastIndexOf/flipBitByIndex/flipBitsByRange 对**浮点/NaN/Infinity/字符串入参抛 401** 已测但错误码表未列，建议补 401。
- **constructor 无错误码表**：NaN/Inf/-Inf/浮点→401、负数容错/401 已测未文档化，建议补 constructor 错误码段。
- **resize 错误码表缺 401 与 10200001**：均已测未文档化（表仅列 10200011/10200201）。
- **[Symbol.iterator] 文档"不支持.ets"与测试存在张力**：建议明确该接口在 .ets 的可用边界（直接 `[Symbol.iterator]()` 调用 vs `for...of` 隐式）。
- **空容器 resize 已修复**：`new BitVector(0).resize(正数)` 已可正常扩容补 0（原 🔴 缺陷已修复，属正常场景）。建议：① 清理 4 个容错用例(`testBitVectorEmptyResizeBoundary0001~0004`)转严格正向断言、更正 `@tc.desc` 过时的"known issue"标注、0003 补 64 位全 0 校验；② 补空容器跨 word 扩容 / 扩容后查询 / 扩容后写操作覆盖（见补充设计 E 组）。
- **未文档化的边界行为**：空 pop 返回 undefined（非 number）、[index] 非数值索引返回 undefined（非抛错），建议文档补充。

## 7.5 优先级建议

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.3-1 getBitsByRange 返回值可操作性、7.3-2 resize 缩容后旧索引抛错 |
| P1 | 7.2 push false 返回路径、7.2 pop 跨线程 10200201、7.3-3 resize 扩容后新零区查询、7.2 空容器 resize 容错用例转正向+补跨word/查询/写操作覆盖 |
| P2 | 7.2 各接口缺参→401、7.3-4/5 组合联动、7.4 文档错误码表补 401、[Symbol.iterator] 用例标注更正 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 |
|------|------|
| 入参范围覆盖 | 合法/正常取值下行为正确性 |
| 边界值测试 | 0、1、单元素、空、length 边界、64/128/1024 word 边界 |
| 异常与非法输入 | 类型错误 401、范围错误 10200001、解绑 10200011、并发 10200201 |
| 返回值与类型验证 | 返回类型与具体值断言 |
| 组合场景 | 多接口串联、读写联动 |
| 重复调用/幂等性 | 同操作多次、二次操作恢复原值 |
| 并发跨线程 | TaskPool/Worker/AsyncLock/100 并发、跨线程修改可见性与错误码 |
