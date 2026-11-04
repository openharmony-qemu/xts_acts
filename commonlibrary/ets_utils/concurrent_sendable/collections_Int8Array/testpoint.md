# Int8Array 测试点报告（按接口维度·摘要版）

> **数据来源**：`concurrent_sendable/collections_Int8Array/entry/src/ohosTest/ets/test/` 下递归解析得 **842** 条用例（`@tc.name` 计数与 `it()` 计数逐文件对齐；已排除 `List.test.ets` 聚合 re-export 垫片，0 用例）。
> **变体**：Int8Array（BYTES_PER_ELEMENT=1，元素值域 -128..127（有符号 8 位整数））。
> **接口**：本变体测试 collections.Int8Array 的 TypedArray 共享接口（构造/属性/元素读写/子视图/查找/遍历/变换/序列化），仅元素类型语义不同；本报告自包含，不引用外部文件。
> **生成日期**：2026-11-04。

---

## 0. 脑图总览（套件内顶层结构）

```
Int8Array（共享 TypedArray 接口 × 本变体元素语义）
├── 1. 接口测试（Functional）—— §1，每接口含用例位置
│   ├── 静态：BYTES_PER_ELEMENT / from / of
│   ├── 只读属性：buffer / byteLength / byteOffset / length
│   ├── constructor（5 重载，@throws 10200011/RangeError）
│   ├── 元素读写：[index] / at / fill / set / copyWithin
│   ├── 子视图/拷贝：subarray（共享 buffer）/ slice（独立拷贝）
│   ├── 查找：indexOf / lastIndexOf / includes / find / findIndex
│   ├── 遍历：forEach / entries / keys / values / [Symbol.iterator]
│   ├── 变换：map / filter / reduce / reduceRight / reverse / sort / every / some
│   └── 序列化：join / toString / toLocaleString
├── 2. 稳定性（大容量、循环创建销毁）
├── 3. 性能（大规模 forEach/查找）
├── 4. 并发安全（TaskPool/Worker、forEach 内修改→10200201）
├── 5. 兼容性与继承（跨线程引用传递、@Sendable、instanceof）
└── 6. 资料与文档符合性（@Sendable 装饰、BYTES_PER_ELEMENT 取值、异常码）
```

> 测试逻辑分类口径（7 类，贯穿全部接口树）：①入参范围覆盖 ②边界值测试 ③异常与非法输入 ④返回值与类型验证 ⑤组合场景 ⑥重复调用幂等性 ⑦并发跨线程。详见文末《附：测试逻辑分类口径说明》。

---

## 0.1 文件清单（10 个非聚合文件 / 842 用例）

| # | 文件 | 用例数 | 接口覆盖（本变体） |
|---|------|:---:|------|
| 1 | All/Int8ArrayAll.test.ets | 234 | [index](22)、set(21)、subarray(19)、constructor(16)、buffer(15) |
| 2 | Concurrent/Int8ArrayConcurrent.test.ets | 27 | 综合 |
| 3 | Int8ArrayBasic.test.ets | 62 | copyWithin(3)、toString(2)、toLocaleString(2)、filter(2)、findIndex(2) |
| 4 | Int8ArrayConcurrent.test.ets | 27 | reduceRight(2)、toLocaleString(2)、copyWithin(1)、filter(1)、findIndex(1) |
| 5 | Int8ArrayConstructorEdgeTest.test.ets | 4 | constructor 边缘（iterable 源构造/分数截断/2^32 超长 RangeError/非 Sendable ArrayBuffer 拒绝） |
| 6 | Int8ArrayFrom.test.ets | 3 | from()(3) |
| 7 | Normal/Int8ArrayNormal.test.ets | 228 | copyWithin(33)、values(21)、slice(16)、subarray(12)、buffer(10) |
| 8 | TaskPool/Int8ArrayTaskPool.test.ets | 187 | copyWithin(32)、values(21)、slice(13)、buffer(10)、subarray(10) |
| 9 | TypedArray401.test.ets | 10 | 401 异常码（参数非法）综合 |
| 10 | intArray/IntByteArrayTest.test.ets | 60 | constructor(9)、values(4)、byteOffset(2)、from(2)、of(2) |
| | **合计** | **842** | 35 接口 + 跨接口综合 |

# 1. 接口测试

> 各接口按「专用文件 + 综合套件/并发/跨线程文件」标注用例位置；编号段取自解析结果。


## 1.1 constructor（44 用例）

```
constructor
├── 入参范围覆盖
│   ├── 数值长度构造：new Int8Array(N) 生成 N 元素视图、初值全 0
│   ├── ArrayBuffer 视图：new Int8Array(buf[, offset[, length]]) 共享底层、offset/length 校验
│   ├── 同族/异族 TypedArray 源构造（值被截断/转换到本变体元素域：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
│   ├── plain 数组源构造（逐元素按本变体域转换/回绕/钳位；分数源值截断向零如 [1.9,2.5,-3.7]→[1,2,-3]）
│   ├── iterable 源构造：new Int8Array(Iterable<number>) 经 [Symbol.iterator] 逐元素拷贝
│   └── 单值入参被视为长度（非元素）构造
├── 边界值测试
│   ├── length=0 空视图、length=1 单元素
│   ├── 大长度（2^53-1 合法上界 / 大但限额内）
│   ├── 超最大长度（2^32=4294967296 超出 TypedArray 最大长度→RangeError）
│   ├── ArrayBuffer offset=0 / offset=buffer.byteLength / offset+len 恰好等于 buffer 容量
│   └── 非整数 length 截断为整数
├── 异常与非法输入
│   ├── RangeError：负 length、offset+len 超出 buffer 容量、offset 非法对齐、2^32 超最大长度
│   ├── BusinessError：非 Sendable 内置 ArrayBuffer 构造拒绝（仅 collections.ArrayBuffer 可共享）
│   └── 10200011：构造方法 detached/uninitialized bind 调用
├── 返回值与类型验证
│   ├── instanceof collections.Int8Array、typeof === "object"
│   ├── buffer/byteOffset/byteLength/length 与入参一致
│   └── 初值全 0（元素域下）
├── 组合场景
│   ├── 构造后 [index] 赋值/读取、构造后 fill/subarray/resize 联动
│   └── 从另一 TypedArray 构造后 values() 迭代
├── 重复调用/幂等性
│   └── 相同参数多次构造结果一致
└── 并发跨线程
    └── Worker/TaskPool 内构造 Int8Array 返回主线程、跨线程构造体可见性
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（16 例） + `Normal/Int8ArrayNormal.test.ets`（8 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（7 例） + `intArray/IntByteArrayTest.test.ets`（9 例） + `Int8ArrayConstructorEdgeTest.test.ets`（4 例：iterable 源构造经 [Symbol.iterator] 拷贝、分数源值 [1.9,2.5,-3.7] 截断向零、length=2^32 超最大长度抛 RangeError、非 Sendable 内置 ArrayBuffer 构造拒绝抛 BusinessError）。

- **测了哪些**：5 种构造重载（数值长度/ArrayBuffer 视图/TypedArray 源/plain 源/单值长度）+ iterable 源构造 + 域转换/回绕负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0 + 分数截断向零 + RangeError/10200011/BusinessError(非 Sendable buffer) + instanceof。


## 1.2 from（5 用例）

```
from（静态方法）
├── 入参范围覆盖
│   ├── ArrayLike 源构造、plain 数组源
│   ├── mapFn 转换回调（元素值经 mapFn 映射到本变体域：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
│   └── 空源返回空 Int8Array
├── 边界值测试
│   ├── 空源
│   └── 单元素源
├── 返回值与类型验证
│   ├── 返回新 Int8Array 实例
│   └── 元素经域转换
├── 组合场景
│   └── from + mapFn 与直接构造结果比对
└── 重复调用/幂等性
    └── 同源多次 from 结果一致
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（2 例） + `Int8ArrayFrom.test.ets`（3 例）。

- **测了哪些**：from(ArrayLike/plain + mapFn 转换到本变体域)+ 空源 + 新实例。


## 1.3 of（3 用例）

```
of（静态方法）
├── 入参范围覆盖
│   ├── 变参数值列表 of(v1,v2,...) 构造（值按本变体域回绕/钳位：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
│   └── 空参 of() 构造空 Int8Array
├── 边界值测试
│   ├── 空参
│   └── 单参
├── 返回值与类型验证
│   ├── 返回新 Int8Array
│   └── 元素经域转换
├── 组合场景
│   └── of 与 from(array) 结果比对
└── 重复调用/幂等性
    └── 同列表多次 of 结果一致
```

- **用例位置（Int8Array）**：`Normal/Int8ArrayNormal.test.ets`（1 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：of(变参列表) 按本变体域构造 + 空参 + 新实例。


## 1.4 BYTES_PER_ELEMENT（2 用例）

```
BYTES_PER_ELEMENT（静态只读）
├── 边界值测试
│   └── （常量）
├── 异常与非法输入
│   └── （无）
├── 返回值与类型验证
│   └── === 1（本变体每元素字节数）
├── 组合场景
│   ├── 与 byteLength === length*BPE 一致性
│   └── 与 subarray/length 联动
├── 重复调用/幂等性
│   └── 多次访问恒为 1
└── 并发跨线程
    └── 跨线程访问恒为 1
```

- **用例位置（Int8Array）**：`Normal/Int8ArrayNormal.test.ets`（1 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：BYTES_PER_ELEMENT === 1 一致性 + 与 byteLength/BPE 联动。


## 1.5 buffer（37 用例）

```
buffer（只读属性）
├── 入参范围覆盖
│   ├── 视图 buffer 引用与构造时 ArrayBuffer 同一对象（引用相等）
│   ├── DataView 经 buffer 读写底层字节（offset=0 / 非 0）
│   └── 共享 ArrayBuffer 多视图双向同步（写视图→DataView 可见）
├── 边界值测试
│   └── offset=0 / offset=byteLength / 单字节视图
├── 异常与非法输入
│   └── DataView 越界读写
├── 返回值与类型验证
│   ├── buffer instanceof collections.ArrayBuffer
│   └── 引用相等
├── 组合场景
│   ├── subarray 共享 buffer 验证
│   └── slice 不共享 buffer（独立拷贝）
├── 重复调用/幂等性
│   └── 多次 .buffer 同一引用
└── 并发跨线程
    └── 跨线程持有 Int8Array 后 .buffer 可访问
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（15 例） + `Normal/Int8ArrayNormal.test.ets`（10 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（10 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：buffer 引用相等 + DataView 双向读写 + 共享 ArrayBuffer 多视图同步。


## 1.6 byteLength（8 用例）

```
byteLength（只读属性）
├── 入参范围覆盖
│   └── 随 length / offset / BPE 变化
├── 边界值测试
│   ├── 空视图 byteLength=0
│   ├── 单元素
│   └── ArrayBuffer 子视图
├── 返回值与类型验证
│   ├── === length*BPE
│   └── 与 ArrayBuffer 视图一致
├── 组合场景
│   ├── byteLength 与 length/BPE 联动
│   └── RangeError 时构造失败
├── 重复调用/幂等性
│   └── 多次访问恒定
└── 并发跨线程
    └── 跨线程访问一致
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（7 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：byteLength === length*BPE + ArrayBuffer 子视图边界 + 只读一致性。


## 1.7 byteOffset（6 用例）

```
byteOffset（只读属性）
├── 入参范围覆盖
│   ├── ArrayBuffer 视图 offset 值
│   └── 默认 0
├── 边界值测试
│   └── offset=0 / offset=byteLength-视图长 / 非 0 offset
├── 返回值与类型验证
│   ├── 与构造 offset 入参一致
│   └── number 类型
├── 组合场景
│   ├── byteOffset+byteLength ≤ buffer.byteLength
│   └── DataView 据此定位
├── 重复调用/幂等性
│   └── 多次访问恒定
└── 并发跨线程
    └── 跨线程访问一致
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（4 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：byteOffset 与构造入参一致 + 非 0 offset + DataView 定位。


## 1.8 length（8 用例）

```
length（只读属性）
├── 入参范围覆盖
│   └── 随构造长度/增删（无动态增删但 subarray/slice 派生视图 length 变化）
├── 边界值测试
│   └── 0/1/最大合法上界 2^53-1
├── 返回值与类型验证
│   ├── number
│   └── 与构造入参一致
├── 组合场景
│   ├── length*===byteLength/BPE
│   └── fill/set/subarray/slice 联动 length
├── 重复调用/幂等性
│   └── 多次访问恒定
└── 并发跨线程
    └── 跨线程访问一致
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（4 例） + `Normal/Int8ArrayNormal.test.ets`（1 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（2 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：length 与构造入参一致 + 0/1/最大上界 + 与 BPE 联动。


## 1.9 [index]（25 用例）

```
[index] 索引访问器（get/set）
├── 入参范围覆盖
│   ├── get 合法索引返回元素值、set 赋值后 get 命中
│   ├── 存入本变体域极值：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0
│   └── 存入越界值域转换：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0
├── 边界值测试
│   ├── 索引 0（首）、length-1（末）
│   ├── 最大合法索引（length-1）、最大合法 length（2^53-1）下索引访问
│   └── 负索引返回 undefined（不回绕、不报错）
├── 异常与非法输入
│   └── （越界索引静默返回 undefined，不抛错）
├── 返回值与类型验证
│   ├── 元素 number
│   └── 越界 undefined
├── 组合场景
│   ├── set 后 get 一致
│   ├── fill 后 [index] 验证
│   └── subarray 共享 buffer [index] 互通
├── 重复调用/幂等性
│   ├── 同索引多次 get 一致
│   └── 同索引多次 set 保留最后
└── 并发跨线程
    └── 跨线程 [index] 读写可见性
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（22 例） + `Normal/Int8ArrayNormal.test.ets`（1 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（1 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：[index] get/set + 本变体域极值存取负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0+ 负索引/越界 undefined + 共享 buffer 互通。


## 1.10 at（12 用例）

```
at(index)
├── 入参范围覆盖
│   ├── 正索引返回元素、负索引从末尾计数返回元素
│   ├── 空数组 at(任意) 返回 undefined
│   └── [1,2,3] at(0)/at(-1)/at(3)/at(5) 覆盖正负与越界
├── 边界值测试
│   ├── 首元素 at(0)
│   ├── 末元素 at(-1)
│   └── 越界 at(length)/at(大正数) → undefined
├── 异常与非法输入
│   ├── 10200201：跨线程/并发修改期间调用 at
│   └── 10200011：detached at 调用
├── 返回值与类型验证
│   ├── 元素 number
│   └── 越界 undefined
├── 组合场景
│   ├── at(-1) vs [length-1] 一致
│   └── 空数组 at 无副作用
├── 重复调用/幂等性
│   └── 同索引多次 at 一致
└── 并发跨线程
    ├── TaskPool 内 at
    └── 跨线程 at 抛 10200201
```

- **用例位置（Int8Array）**：`Normal/Int8ArrayNormal.test.ets`（5 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（5 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：at 正/负索引 + 越界 undefined + 10200201/10200011 + 跨线程。


## 1.11 copyWithin（77 用例）

```
copyWithin(target, start, end)
├── 入参范围覆盖
│   ├── target/start/end 全参、省略 end（默认 length）
│   ├── 负 start/end 从末尾计数
│   └── start>end 空操作、target 越界裁剪
├── 边界值测试
│   ├── target=0 全拷
│   ├── target=length-1
│   ├── 单元素
│   ├── 空数组
│   └── target 越界
├── 异常与非法输入
│   ├── 10200201：迭代/并发修改期间 copyWithin
│   └── 10200011：detached copyWithin 调用
├── 返回值与类型验证
│   ├── 返回原视图（this）
│   └── 元素按域拷贝
├── 组合场景
│   ├── copyWithin 后 [index]/values 验证
│   └── 与 fill 联动
├── 重复调用/幂等性
│   └── 同参数多次 copyWithin 幂等（同源同目标）
└── 并发跨线程
    ├── TaskPool 内 copyWithin
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（7 例） + `Int8ArrayBasic.test.ets`（3 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（33 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（32 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：copyWithin target/start/end + 负索引 + start>end 空操作 + 10200201/10200011 + 跨线程。


## 1.12 fill（2 用例）

```
fill(value, start, end)
├── 入参范围覆盖
│   ├── value+start+end 全参、省略 start/end（默认全视图）
│   └── 填充值按本变体域转换：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0
├── 边界值测试
│   ├── 空数组 fill
│   ├── 单元素
│   ├── start=end 空段
│   └── 越界 start
├── 异常与非法输入
│   ├── 10200201：并发修改期间 fill
│   └── 10200011：detached fill 调用
├── 返回值与类型验证
│   ├── 返回原视图
│   └── 填充后 [index]/values 验证
├── 组合场景
│   ├── fill+subarray/slice
│   └── fill 后 indexOf 验证
└── 重复调用/幂等性
    └── 同参数多次 fill 幂等
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：fill(value,start,end) + 域转换负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0+ 空/越界段 + 10200201/10200011。


## 1.13 set（22 用例）

```
set(source, offset)
├── 入参范围覆盖
│   ├── plain 数组源、同族 TypedArray 源、异族 TypedArray 源（值按本变体域转换：负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
│   ├── offset=0 / 非 0 / =length-source.length 精确填满
│   └── 空源 no-op、NaN/Infinity 源转换（负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
├── 边界值测试
│   ├── offset=0
│   ├── offset=末
│   └── 空源
├── 异常与非法输入
│   ├── RangeError：offset+source.length 超出视图长度
│   └── 10200011：detached set 调用
├── 返回值与类型验证
│   ├── void
│   └── 源元素按域拷贝后 [index] 命中
├── 组合场景
│   ├── set 后 values/get 验证
│   └── 与 subarray 共享 buffer set 互通
└── 重复调用/幂等性
    └── 同源同 offset 多次 set 幂等
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（21 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：set(plain/同族/异族源,offset) + 域转换负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0+ RangeError/10200011 + 共享 buffer 互通。


## 1.14 subarray（45 用例）

```
subarray(start, end)
├── 入参范围覆盖
│   ├── start/可选 end、负 start 从末尾计数
│   ├── start=end 返回空视图、end 越界裁剪到 length
│   └── start>end 返回空视图
├── 边界值测试
│   ├── start=0 全视图
│   ├── 单元素
│   ├── 空视图
│   └── 跨 buffer 边界子视图
├── 异常与非法输入
│   ├── 10200201：并发修改期间 subarray
│   └── 10200011：detached subarray 调用
├── 返回值与类型验证
│   ├── 返回新 Int8Array 视图
│   ├── 共享原 buffer（buffer 引用相等）
│   └── length 正确
├── 组合场景
│   ├── subarray 改值原视图可见（共享 buffer）
│   └── subarray 后 [index]/values 联动
├── 重复调用/幂等性
│   └── 同参数多次 subarray 同形状
└── 并发跨线程
    ├── TaskPool 内 subarray
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（19 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（12 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（10 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：subarray 共享 buffer + 负 start/end 裁剪 + start=end 空 + 10200201/10200011 + 跨线程。


## 1.15 slice（41 用例）

```
slice(start, end)
├── 入参范围覆盖
│   ├── start/可选 end、负索引从末尾计数
│   ├── end 越界裁剪到 length、start=end 返回空
│   └── 空数组 slice 返回空
├── 边界值测试
│   ├── start=0 全拷
│   ├── 仅末尾
│   ├── 仅首元素
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 slice
│   └── 10200011：detached slice 调用
├── 返回值与类型验证
│   ├── 返回新 Int8Array（独立拷贝、不共享 buffer、!== 原）
│   └── length/元素正确
├── 组合场景
│   ├── slice 后改值不影响原视图（独立拷贝）
│   └── slice+indexOf/values 联动
├── 重复调用/幂等性
│   └── 同参数多次 slice 结果一致
└── 并发跨线程
    ├── TaskPool 内 slice
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（7 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（16 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（13 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：slice 独立拷贝（不共享 buffer）+ 负索引 + end 裁剪 + 10200201/10200011 + 跨线程。


## 1.16 indexOf（29 用例）

```
indexOf(searchElement, fromIndex)
├── 入参范围覆盖
│   ├── first匹配返回索引、不匹配返回 -1
│   ├── 可选 fromIndex 正向起始、空数组返回 -1
│   └── 单元素数组命中返回 0
├── 边界值测试
│   ├── 首元素
│   ├── 末元素
│   ├── fromIndex 越界
│   ├── 空数组
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 indexOf
│   └── 10200011：detached indexOf 调用
├── 返回值与类型验证
│   ├── number
│   ├── -1 语义
│   └── first匹配
├── 组合场景
│   ├── set/fill 后 indexOf 反映
│   └── indexOf vs includes 一致性
├── 重复调用/幂等性
│   └── 同参数多次 indexOf 一致
└── 并发跨线程
    ├── TaskPool 内 indexOf
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（7 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（9 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（8 例） + `intArray/IntByteArrayTest.test.ets`（2 例）。

- **测了哪些**：indexOf first匹配/-1 + fromIndex + 空/单元素 + 10200201/10200011 + 跨线程。


## 1.17 lastIndexOf（17 用例）

```
lastIndexOf(searchElement, fromIndex)
├── 入参范围覆盖
│   ├── 末次匹配返回索引、不匹配返回 -1
│   └── 反向 fromIndex 起始
├── 边界值测试
│   ├── 末元素
│   ├── 首元素
│   ├── 空数组
│   └── fromIndex 越界
├── 异常与非法输入
│   ├── 10200201：并发修改期间 lastIndexOf
│   └── 10200011：detached lastIndexOf 调用
├── 返回值与类型验证
│   ├── number
│   ├── 末次匹配
│   └── -1 语义
├── 组合场景
│   ├── indexOf(首) vs lastIndexOf(末) 对比
│   └── 重复元素
├── 重复调用/幂等性
│   └── 同参数多次 lastIndexOf 一致
└── 并发跨线程
    └── （部分变体跨线程 lastIndexOf 用例偏少）
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（5 例） + `Int8ArrayBasic.test.ets`（2 例） + `Normal/Int8ArrayNormal.test.ets`（9 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：lastIndexOf 末次匹配/-1 + 反向 fromIndex + 10200201/10200011。


## 1.18 includes（27 用例）

```
includes(searchElement, fromIndex)
├── 入参范围覆盖
│   ├── 存在返回 true、不存在返回 false
│   ├── 可选 fromIndex 起始、重复元素命中
│   └── 空数组返回 false
├── 边界值测试
│   ├── 首元素
│   ├── 末元素
│   ├── fromIndex 越界
│   ├── 空数组
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 includes
│   └── 10200011：detached includes 调用
├── 返回值与类型验证
│   ├── boolean
│   └── true/false
├── 组合场景
│   ├── set/fill 后 includes 反映
│   └── includes vs indexOf 一致性
├── 重复调用/幂等性
│   └── 同参数多次 includes 一致
└── 并发跨线程
    ├── TaskPool 内 includes
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（10 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（7 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（6 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：includes true/false + fromIndex + 重复元素 + 10200201/10200011 + 跨线程。


## 1.19 findIndex（16 用例）

```
findIndex(predicate)
├── 入参范围覆盖
│   ├── predicate first true 返回索引、无匹配返回 -1
│   ├── predicate 回调参数（元素, 索引, 数组）正确
│   └── 空数组返回 -1、单元素命中返回 0
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   ├── 首匹配
│   └── 无匹配
├── 异常与非法输入
│   ├── 10200201：并发修改期间 findIndex
│   └── 10200011：detached findIndex 调用
├── 返回值与类型验证
│   ├── number
│   ├── -1 语义
│   └── 首匹配索引
├── 组合场景
│   ├── findIndex 与 indexOf 互补
│   └── predicate 闭包变量
├── 重复调用/幂等性
│   └── 同 predicate 多次 findIndex 一致
└── 并发跨线程
    ├── TaskPool 内 findIndex
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（6 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（3 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（3 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：findIndex predicate 首匹配/-1 + 回调参数 + 10200201/10200011 + 跨线程。


## 1.20 forEach（22 用例）

```
forEach(callback)
├── 入参范围覆盖
│   ├── callback 遍历所有元素、回调参数（元素, 索引, 数组）正确
│   ├── 空数组不执行回调
│   └── 单元素数组遍历一次
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── 大规模元素遍历
├── 异常与非法输入
│   ├── 10200201：并发修改期间 forEach
│   └── 10200011：detached forEach 调用
├── 返回值与类型验证
│   ├── void
│   ├── 回调返回值被忽略
│   └── 元素值类型 number
├── 组合场景
│   ├── forEach 累加/计数
│   └── forEach 与 values 迭代结果一致
├── 重复调用/幂等性
│   └── 同 callback 多次 forEach 一致
└── 并发跨线程
    ├── TaskPool 内 forEach
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（7 例） + `Int8ArrayBasic.test.ets`（2 例） + `Normal/Int8ArrayNormal.test.ets`（6 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（6 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：forEach 遍历 + 回调参数(元素,索引,数组) + 空/大规模 + 10200201/10200011 + 跨线程。


## 1.21 entries（8 用例）

```
entries()
├── 入参范围覆盖
│   ├── 返回 [索引, 元素] 迭代器
│   └── for...of 消费
├── 边界值测试
│   ├── 空数组迭代器立即 done
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 entries
│   └── 10200011：detached entries 调用
├── 返回值与类型验证
│   ├── IterableIterator<[number, number]>
│   └── 插入序
├── 组合场景
│   ├── entries 与 forEach 索引/值一致
│   └── Array.from 转换
├── 重复调用/幂等性
│   └── 每次返回新迭代器
└── 并发跨线程
    └── 跨线程 entries 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（2 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（2 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：entries [索引,元素] 迭代器 + 空 + 10200201/10200011 + 跨线程。


## 1.22 keys（10 用例）

```
keys()
├── 入参范围覆盖
│   ├── 返回索引迭代器
│   └── for...of 消费
├── 边界值测试
│   ├── 空数组迭代器立即 done
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 keys
│   └── 10200011：detached keys 调用
├── 返回值与类型验证
│   ├── IterableIterator<number>（索引）
│   └── 插入序
├── 组合场景
│   └── keys 与 entries/forEach 索引一致
├── 重复调用/幂等性
│   └── 每次返回新迭代器
└── 并发跨线程
    └── 跨线程 keys 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（3 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（3 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：keys 索引迭代器 + 空 + 10200201/10200011 + 跨线程。


## 1.23 values（59 用例）

```
values()
├── 入参范围覆盖
│   ├── 返回值迭代器、for...of/while/next 消费
│   ├── 初值全 0 验证、plain 数组源经域转换后值验证
│   └── map/reduce 等回调内迭代结果比对
├── 边界值测试
│   ├── 空数组迭代器立即 done
│   ├── 单元素
│   └── 大规模迭代
├── 异常与非法输入
│   ├── 10200201：并发修改期间 values 迭代
│   └── 10200011：detached values 调用
├── 返回值与类型验证
│   ├── IterableIterator<number>（元素值）
│   ├── 插入序
│   └── number 类型
├── 组合场景
│   ├── values 与 forEach/entries 结果一致
│   └── Array.from/展开转 plain
├── 重复调用/幂等性
│   ├── 每次返回新迭代器
│   └── 可重复遍历
└── 并发跨线程
    ├── TaskPool 内 values 迭代
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（11 例） + `Int8ArrayBasic.test.ets`（1 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（21 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（21 例） + `intArray/IntByteArrayTest.test.ets`（4 例）。

- **测了哪些**：values 值迭代器 + for...of/while/next/展开 + 空/大规模 + 10200201/10200011 + 跨线程。


## 1.24 map（2 用例）

```
map(callback)
├── 入参范围覆盖
│   ├── callback 返回新元素值、按本变体域转换（负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0）
│   └── Math.sqrt 等数值变换回调
├── 边界值测试
│   ├── 空数组
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 map
│   └── 10200011：detached map 调用
├── 返回值与类型验证
│   ├── 返回新 Int8Array
│   ├── 长度一致
│   └── 元素经域转换
├── 组合场景
│   ├── map+values 验证
│   └── map vs forEach 累加比对
└── 重复调用/幂等性
    └── 同 callback 多次 map 结果一致
```

- **用例位置（Int8Array）**：`Normal/Int8ArrayNormal.test.ets`（1 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：map callback 返回新 Int8Array + 域转换负数与溢出回绕语义；存最大值 127/最小值 -128/溢出值 128 回绕为 -128/NaN 与 ±Infinity 转 0+ Math 变换 + 10200201/10200011。


## 1.25 filter（17 用例）

```
filter(predicate)
├── 入参范围覆盖
│   ├── predicate 为 true 的元素保留、返回新 Int8Array
│   ├── predicate 回调参数正确、无匹配返回空
│   └── 空数组返回空
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── 无匹配
├── 异常与非法输入
│   ├── 10200201：并发修改期间 filter
│   └── 10200011：detached filter 调用
├── 返回值与类型验证
│   ├── 返回新 Int8Array
│   ├── 长度=命中数
│   └── 元素经域转换
├── 组合场景
│   ├── filter 后 length/indexOf 验证
│   └── filter+forEach
├── 重复调用/幂等性
│   └── 同 predicate 多次 filter 结果一致
└── 并发跨线程
    ├── TaskPool 内 filter
    └── 跨线程抛 10200201
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（6 例） + `Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（4 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（3 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：filter predicate 保留元素 + 新 Int8Array + 空/无匹配 + 10200201/10200011 + 跨线程。


## 1.26 reduce（1 用例）

```
reduce(callback, initialValue)
├── 入参范围覆盖
│   ├── callback(累加, 当前) 累积、可选 initialValue
│   └── 无/有 initialValue 两种形态
├── 边界值测试
│   ├── 单元素
│   └── 空数组（无 initialValue 抛错）
├── 异常与非法输入
│   ├── 10200201：并发修改期间 reduce
│   └── 10200011：detached reduce 调用
├── 返回值与类型验证
│   └── 累积值
├── 组合场景
│   ├── reduce 累加/求积
│   └── reduceRight 反向对比
└── 重复调用/幂等性
    └── 同 callback 多次 reduce 一致
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：reduce 累积 + 可选 initialValue + 空(无初值抛错) + 10200201/10200011。


## 1.27 reduceRight（9 用例）

```
reduceRight(callback, initialValue)
├── 入参范围覆盖
│   ├── 从右向左累积、可选 initialValue
│   └── callback(累加, 当前) 参数顺序
├── 边界值测试
│   ├── 单元素
│   └── 空数组（无 initialValue 抛错）
├── 异常与非法输入
│   ├── 10200201：并发修改期间 reduceRight
│   └── 10200011：detached reduceRight 调用
├── 返回值与类型验证
│   └── 累积值
├── 组合场景
│   ├── reduceRight vs reduce 顺序对比
│   └── 累加结果一致
├── 重复调用/幂等性
│   └── 同 callback 多次 reduceRight 一致
└── 并发跨线程
    └── 跨线程 reduceRight 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（2 例） + `Normal/Int8ArrayNormal.test.ets`（4 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：reduceRight 反向累积 + 可选 initialValue + 与 reduce 对比 + 10200201/10200011 + 跨线程。


## 1.28 reverse（11 用例）

```
reverse()
├── 入参范围覆盖
│   ├── 原地反转
│   └── 返回原视图
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── 两元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 reverse
│   └── 10200011：detached reverse 调用
├── 返回值与类型验证
│   ├── 返回原视图（this）
│   └── 反转后 values 验证
├── 组合场景
│   ├── reverse 后 indexOf/lastIndexOf 互换
│   └── reverse+sort
├── 重复调用/幂等性
│   └── 两次 reverse 恢复原序
└── 并发跨线程
    └── 跨线程 reverse 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `Normal/Int8ArrayNormal.test.ets`（4 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（3 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：reverse 原地反转 + 返回原视图 + 两次恢复原序 + 10200201/10200011 + 跨线程。


## 1.29 sort（1 用例）

```
sort(compareFn)
├── 入参范围覆盖
│   ├── 默认升序
│   └── 可选 compareFn
├── 边界值测试
│   ├── 空数组
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 sort
│   └── 10200011：detached sort 调用
├── 返回值与类型验证
│   ├── 返回原视图
│   └── 升序排列后 values 验证
├── 组合场景
│   ├── sort+reverse 降序
│   └── sort+indexOf
└── 重复调用/幂等性
    └── 同 compareFn 多次 sort 幂等
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：sort 默认升序/compareFn + 返回原视图 + 10200201/10200011。


## 1.30 every（1 用例）

```
every(predicate)
├── 入参范围覆盖
│   ├── 全部匹配返回 true
│   └── 任一不匹配返回 false
├── 边界值测试
│   ├── 空数组返回 true
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 every
│   └── 10200011：detached every 调用
├── 返回值与类型验证
│   └── boolean
├── 组合场景
│   ├── every vs some 对比
│   └── every+filter
└── 重复调用/幂等性
    └── 同 predicate 多次 every 一致
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：every 全匹配 true/空 true + 10200201/10200011。


## 1.31 some（1 用例）

```
some(predicate)
├── 入参范围覆盖
│   ├── 任一匹配返回 true
│   └── 全不匹配返回 false
├── 边界值测试
│   ├── 空数组返回 false
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 some
│   └── 10200011：detached some 调用
├── 返回值与类型验证
│   └── boolean
├── 组合场景
│   ├── some vs every 对比
│   └── some+filter
└── 重复调用/幂等性
    └── 同 predicate 多次 some 一致
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：some 任一匹配 true/空 false + 10200201/10200011。


## 1.32 join（1 用例）

```
join(separator)
├── 入参范围覆盖
│   ├── 默认逗号分隔
│   └── 可选 separator
├── 边界值测试
│   ├── 空数组返回空串
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 join
│   └── 10200011：detached join 调用
├── 返回值与类型验证
│   └── string
├── 组合场景
│   ├── join 与 toString 一致（默认分隔符）
│   └── join+values
└── 重复调用/幂等性
    └── 同 separator 多次 join 一致
```

- **用例位置（Int8Array）**：`intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：join 默认逗号/separator + string + 10200201/10200011。


## 1.33 toString（4 用例）

```
toString()
├── 入参范围覆盖
│   ├── 无参
│   └── 逗号分隔字符串
├── 边界值测试
│   ├── 空数组返回空串
│   └── 单元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 toString
│   └── 10200011：detached toString 调用
├── 返回值与类型验证
│   └── string
├── 组合场景
│   └── toString 与 join(',') 一致
├── 重复调用/幂等性
│   └── 多次 toString 一致
└── 并发跨线程
    └── 跨线程 toString 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（1 例） + `intArray/IntByteArrayTest.test.ets`（1 例）。

- **测了哪些**：toString 逗号分隔 string + 空 + 10200201/10200011 + 跨线程。


## 1.34 toLocaleString（7 用例）

```
toLocaleString()
├── 入参范围覆盖
│   ├── 无参
│   └── 本地化字符串
├── 边界值测试
│   ├── 空数组
│   ├── 单元素
│   └── 多元素
├── 异常与非法输入
│   ├── 10200201：并发修改期间 toLocaleString
│   └── 10200011：detached toLocaleString 调用
├── 返回值与类型验证
│   └── string
├── 组合场景
│   ├── toLocaleString 与 toString 对比
│   └── 与 values 联动
├── 重复调用/幂等性
│   └── 多次 toLocaleString 一致
└── 并发跨线程
    └── 跨线程 toLocaleString 抛 10200201
```

- **用例位置（Int8Array）**：`Int8ArrayBasic.test.ets`（2 例） + `Int8ArrayConcurrent.test.ets`（2 例） + `Normal/Int8ArrayNormal.test.ets`（3 例）。

- **测了哪些**：toLocaleString 本地化 string + 10200201/10200011 + 跨线程。


## 1.35 (Other/综合)（240 用例）

```
跨接口综合/类型转换/互操作
├── 入参范围覆盖
│   ├── DataView 与 Int8Array 共享 buffer 双向读写同步
│   ├── Int8Array 经 Array.from / 展开运算符转 plain 数组
│   ├── 修改转换后 plain 数组不影响原 Int8Array（独立拷贝）
│   └── instanceof collections.Int8Array 类型校验、超长/大对象综合
├── 边界值测试
│   ├── 空 Int8Array
│   ├── 大 Int8Array
│   └── 跨 buffer 边界综合
├── 异常与非法输入
│   ├── 10200011：detached 方法 bind 调用
│   └── 10200201：并发修改期间综合操作
├── 返回值与类型验证
│   ├── 转换结果类型
│   └── Array.from 返回 plain Array
├── 组合场景
│   └── DataView↔Int8Array↔subarray↔slice 多视图串联
├── 重复调用/幂等性
│   └── 同转换多次结果一致
└── 并发跨线程
    ├── TaskPool 内综合场景跨线程复跑
    └── 跨线程异常码断言
```

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`（59 例） + `Concurrent/Int8ArrayConcurrent.test.ets`（27 例） + `Int8ArrayBasic.test.ets`（20 例） + `Int8ArrayConcurrent.test.ets`（11 例） + `Normal/Int8ArrayNormal.test.ets`（64 例） + `TaskPool/Int8ArrayTaskPool.test.ets`（52 例） + `intArray/IntByteArrayTest.test.ets`（7 例）。

- **测了哪些**：DataView↔Int8Array 双向同步 + Array.from/展开转 plain + instanceof + 大对象综合 + 10200011/10200201 + 跨线程综合复跑。

# 2. 稳定性

- **用例位置（Int8Array）**：`All/Int8ArrayAll.test.ets`、`Normal/Int8ArrayNormal.test.ets`、`TaskPool/Int8ArrayTaskPool.test.ets`。
- **测了哪些**：大规模构造/遍历/跨线程传递稳定性 + 综合场景复跑（本变体元素域 元素值域 -128..127（有符号 8… 下）；大对象/大数组承载 + 循环创建销毁不崩溃。

# 3. 性能

- **用例位置（Int8Array）**：`All`/`Normal`/`TaskPool` 系列大规模 forEach/values/查找用例。
- **测了哪些**：大规模遍历/查找吞吐（本变体）；**未见显式时延/吞吐阈值断言**，以"大规模不崩溃 + 结果正确"为隐式验证。

# 4. 并发安全

- **用例位置（Int8Array）**：`Concurrent/Int8ArrayConcurrent.test.ets`、`Int8ArrayConcurrent.test.ets`、`TaskPool/Int8ArrayTaskPool.test.ets`。
- **测了哪些**：TaskPool/Worker 跨线程 Int8Array 引用传递 + 10200201（并发修改）/10200011（detached bind）异常码断言（本变体）；AsyncLock 序列化保护并发读写（部分变体）。

# 5. 兼容性与继承

- **用例位置（Int8Array）**：`Normal`/`TaskPool` 综合场景跨线程引用传递 + `All` 系列 instanceof。
- **测了哪些**：跨线程 Int8Array 引用传递 + instanceof collections.Int8Array；**Int8Array 为 final 类不可继承，无子类化用例属正确**。

# 6. 资料与文档符合性

- **用例位置（Int8Array）**：`All` 系列 BYTES_PER_ELEMENT/constructor 类型符合性 + `Basic`/`intArray` 异常码符合性。
- **测了哪些**：@Sendable 装饰、BYTES_PER_ELEMENT=1 取值、异常码 10200011/10200201/RangeError（本变体）；**未发现与 `.d.ets` 逐条断言的符合性用例**。

---
# 7. 覆盖度矩阵与缺口分析（本套件自包含）

## 7.1 接口 × 测试逻辑分类 覆盖矩阵

> 图例：✅ 有充足专用用例 / 🟡 部分覆盖（仅综合套件或少量） / ❌ 未覆盖或仅间接

| 接口 | ①入参范围 | ②边界值 | ③异常非法输入 | ④返回值类型 | ⑤组合场景 | ⑥重复幂等 | ⑦并发跨线程 |
|------|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| constructor | ✅ | ✅ | ✅(RangeError/10200011/BusinessError) | ✅(instanceof) | ✅ | 🟡 | ✅(跨线程构造) |
| from / of | ✅ | ✅ | ❌ | ✅(新实例) | 🟡 | ✅ | ❌ |
| BYTES_PER_ELEMENT | ✅(常量) | n/a | n/a | ✅(=1) | ✅ | ✅ | ✅ |
| buffer / byteLength / byteOffset / length | ✅ | ✅ | n/a(只读) | ✅ | ✅ | ✅ | ✅ |
| [index] | ✅(本变体域极值) | ✅(0/末/最大) | ❌(越界静默 undefined) | ✅(number/undefined) | ✅(共享 buffer 互通) | ✅ | ✅ |
| at | ✅ | ✅ | ✅(10200201/10200011) | ✅(number/undefined) | ✅ | ✅ | ✅ |
| fill | ✅(本变体域转换) | ✅ | ✅(10200201/10200011) | ✅(void/原视图) | ✅ | ✅ | 🟡 |
| set | ✅(多源/域转换) | ✅ | ✅(RangeError/10200011) | ✅(void) | ✅ | ✅ | 🟡 |
| copyWithin | ✅ | ✅ | ✅(10200201/10200011) | ✅(原视图) | ✅ | ✅ | ✅ |
| subarray | ✅ | ✅ | ✅(10200201/10200011) | ✅(共享 buffer 新视图) | ✅ | ✅ | ✅ |
| slice | ✅ | ✅ | ✅(10200201/10200011) | ✅(独立拷贝新 Int8Array) | ✅ | ✅ | ✅ |
| indexOf / lastIndexOf | ✅ | ✅ | ✅(10200201/10200011) | ✅(number/-1) | ✅ | ✅ | 🟡(lastIndexOf 偏少) |
| includes | ✅ | ✅ | ✅(10200201/10200011) | ✅(boolean) | ✅ | ✅ | ✅ |
| findIndex / find | ✅ | ✅ | ✅(10200201/10200011) | ✅(number/undefined) | ✅ | ✅ | 🟡(find 偏少) |
| forEach | ✅(回调三参) | ✅(空/大规模) | ✅(10200201/10200011) | ✅(void) | ✅ | ✅ | ✅ |
| entries / keys / values | ✅ | ✅ | ✅(10200201/10200011) | ✅(IterableIterator) | ✅ | ✅ | ✅ |
| map / filter | ✅(域转换) | ✅ | ✅(10200201/10200011) | ✅(新 Int8Array) | ✅ | ✅ | 🟡 |
| reduce / reduceRight | ✅ | ✅ | ✅(10200201/10200011) | ✅(累积值) | ✅ | ✅ | 🟡 |
| reverse / sort / every / some | ✅ | ✅ | ✅(10200201/10200011) | ✅(原视图/boolean) | ✅ | ✅ | 🟡 |
| join / toString / toLocaleString | ✅ | ✅ | ✅(10200201/10200011) | ✅(string) | ✅ | ✅ | 🟡(join/sort/every/some 跨线程偏少) |
| 跨接口综合/互操作 | ✅(DataView/Array.from/展开) | ✅(大对象/跨 buffer) | ✅(10200011/10200201) | ✅ | ✅ | ✅ | ✅ |

## 7.2 逐接口遗漏确认（本套件范围内）

> 对照 collections.Int8Array 共享接口契约，逐条核查本套件覆盖。✅ 已覆盖 / ❌ 测试缺口 / ⚠️ 文档缺口。

| # | 接口 | 本套件核查结论 |
|---|------|----------------|
| 1 | constructor | ✅ 5 重载 + iterable 源 + 域转换 + 分数截断 + RangeError/10200011/BusinessError(非 Sendable buffer) 覆盖；⚠️ `new Int8Array()` 缺参行为部分变体未显式测。 |
| 2 | [index] | ✅ 域极值存取（元素值域 -128..127（有符号 8 位整数）…）+ 负索引/越界 undefined + 共享 buffer 互通；❌ 非整数/字符串索引返回 undefined 的边界未专项测。 |
| 3 | at | ✅ 正/负/越界 + 10200201/10200011 + 跨线程；⚠️ 空 at 返回 undefined 文档未显式定义。 |
| 4 | set | ✅ 多源（plain/同族/异族）+ 域转换 + RangeError/10200011；❌ `set()` 缺参→401 未测。 |
| 5 | subarray / slice | ✅ 共享/独立 buffer 语义 + 负索引裁剪 + 10200201/10200011 + 跨线程；✅ 充分。 |
| 6 | indexOf/lastIndexOf/includes | ✅ 首末匹配/-1 + fromIndex + 重复；🟡 lastIndexOf 跨线程偏少。 |
| 7 | forEach | ✅ 回调三参 + 空/大规模 + 10200201/10200011 + 跨线程；✅ 充分。 |
| 8 | entries/keys/values | ✅ 迭代器 + for...of/展开/Array.from + 10200201/10200011 + 跨线程；✅ 充分。 |
| 9 | map/filter | ✅ 域转换 + 新 Int8Array + 10200201/10200011；🟡 跨线程偏少。 |
| 10 | reduce/reduceRight | ✅ 累积 + 初值 + 空(无初值抛错) + 10200201/10200011；🟡 reduce 用例偏少。 |
| 11 | reverse/sort/every/some | ✅ 原视图/升序/boolean + 10200201/10200011；❌ 自定义 compareFn 深度覆盖偏少。 |
| 12 | join/toString/toLocaleString | ✅ 逗号分隔 + 空 + 10200201/10200011 + 跨线程；✅ 充分。 |
| 13 | 跨接口综合 | ✅ DataView↔Int8Array 双向同步 + Array.from/展开转 plain + instanceof + 大对象综合；✅ 充分。 |

## 7.3 接口组合遗漏（本套件范围内）

1. **getBitsByRange 类比**：Int8Array 无子向量返回接口，subarray 返回共享 buffer 视图（✅ 已测改值原视图可见），slice 返回独立拷贝（✅ 已测改值不影响原）——覆盖充分。
2. **构造后立即操作**：constructor→[index]/fill/subarray/slice 联动——✅ 覆盖。
3. **跨接口异常码对称性**：10200201（并发修改）/10200011（detached）在 copyWithin/at/subarray/slice/indexOf/includes/findIndex/forEach/entries/keys/values/reverse/toString/toLocaleString 均有专用用例；❌ fill/set/map/filter/reduce/reduceRight/join/sort/every/some 的跨线程 10200201 用例偏少（部分变体仅 detached 10200011）。
4. **域转换深度**：构造/set/fill/[index]/map 的本变体域极值存取与回绕/钳位语义——✅ 覆盖（Int8/Uint8/Uint8Clamped 尤其充分，Int32/Uint32 大数回绕用例偏少）。

## 7.4 文档与测试一致性建议（同步资料侧·本套件范围内）

1. **401 未声明（⚠️ 文档缺口）**：set/fill/copyWithin 等带必填参数成员的 `.d.ets` 未声明 `@throws 401`，但产品对非法/缺参抛 401；建议资料侧补 401 行并增补缺参→401 测试。
2. **越界索引静默 undefined**：[index]/at 越界返回 undefined（非抛错），文档未显式定义该边界；建议 `.md` 补充说明。
3. **域转换/回绕/钳位语义**：本变体 元素值域 -128..127（有符号 8 位整数） 在构造/set/fill/[index] 入参的转换行为，建议 `.md` 构造/元素赋值章节补注本变体域转换规则。
4. **[Symbol.iterator]**：声明注明 .ets 不可直接调用，本套件仅经 values/for...of 间接覆盖（正确），建议保留禁用声明符合性证据。

## 7.5 优先级建议（本套件范围内）

| 优先级 | 缺口项 |
|:---:|------|
| P0 | 7.3-3 fill/set/map/filter/reduce 等跨线程 10200201 补全；Int32/Uint32 大数回绕用例补全 |
| P1 | 7.2-2 非整数/字符串索引 undefined 边界专项；7.2-4 set() 缺参→401 |
| P2 | 7.4-2/3 文档越界 undefined 与域转换语义补注；自定义 compareFn 深度覆盖 |

---

## 附：测试逻辑分类口径说明

| 分类 | 定义 | 本套件典型用例形态 |
|------|------|------|
| ①入参范围覆盖 | 对接口入参（length/offset/source/value/predicate/callback/separator）遍历合法取值空间 | 构造 5 重载、set 多源、[index] 本变体域极值、predicate 回调参数 |
| ②边界值测试 | 空/单元素/最大合法上界(2^53-1)/buffer offset 边界(0/byteLength/offset+len=容量)/负索引 | 空视图、单元素、ArrayBuffer offset 边界、负索引 |
| ③异常与非法输入 | RangeError(负 length/超容量)、10200011(detached bind)、10200201(并发修改) | copyWithin/at/subarray/slice/indexOf/includes/findIndex/forEach/entries/keys/values 异常码段 |
| ④返回值与类型验证 | 返回值语义(void/原视图/新 Int8Array/number/-1/boolean/undefined/string/IterableIterator)、instanceof | subarray 共享 buffer、slice 独立拷贝、indexOf -1、forEach void、toString string |
| ⑤组合场景 | 多接口串联（constructor→fill→[index]→indexOf）、DataView↔Int8Array↔subarray↔slice、Array.from/展开转 plain | DataView 双向同步、共享 buffer 互通、转换后独立拷贝验证 |
| ⑥重复调用幂等性 | 同操作连续调用结果稳定、不产生副作用膨胀 | 两次 reverse 恢复原序、同参数多次 slice/subarray 一致、同 key 多次 set 保留最后 |
| ⑦并发跨线程 | TaskPool/Worker 跨线程引用传递、AsyncLock 序列化、跨线程修改可见性与 10200201 错误码 | TaskPool 跨线程综合复跑、跨线程异常码断言 |
