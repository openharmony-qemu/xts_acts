- collections.Set 测试设计
	说明：基于 30 个测试文件、1389 个用例，覆盖 collections.Set 全部 11 个接口成员
	1. 接口测试（Functional）
		constructor
			入参范围覆盖
				数组单/多元素（number/string/boolean/BigInt/emoji/特殊字符）
				Iterable<T> 构造（collections.Set/Map 嵌套、collections.Array）
				@Sendable 类实例 / SendableFuncType / SendableAsyncFnType
				科学计数法浮点 / AsyncLock / ConditionVariable
			边界值测试
				无参空 Set / 空数组 → 空 Set
				null 参数 / undefined
				空字符串 / MAX_SAFE_INTEGER
			异常与非法输入
				10200012 直接调用构造错误（非 new）
			返回值与类型验证
				size 正确 / 元素存在性
				instanceof Set 检测
			组合场景
				从另一 Set/Map 构造（拷贝语义）
			重复调用/幂等性
				重复元素去重（constructor0005）
			并发跨线程
				constructor(iterable) 跨线程引用（AsyncLock 实例）
		size
			入参范围覆盖
				各元素类型 add 后 size 跟踪（number/string/boolean/BigInt/emoji）
			边界值测试
				新建空 Set size=0
				empty string / null / undefined
				MAX_SAFE_INTEGER / NaN
			返回值与类型验证
				add 后 size+1 / delete 后 size-1 / clear 后 size=0
				number 类型断言
			组合场景
				add→delete→clear 序列
				add+delete 同元素多次后 size 一致
			重复调用/幂等性
				重复 add 不增 size / 同元素增删多次 size 不漂移
			并发跨线程
				AsyncLock 元素 size 跟踪
		add
			入参范围覆盖
				number/string/boolean/BigInt/emoji/特殊字符/空字符串
				@Sendable 类 / SendableEnum / 嵌套 collections.Set/Map
				AsyncLock / ConditionVariable / 科学计数法
			边界值测试
				undefined / null / 空字符串
				NaN / +0 / -0 / ±Infinity / MAX_SAFE_INTEGER
				100000 长字符串
			返回值与类型验证
				add 返回 this（链式） / size 唯一性
			组合场景
				链式 add 多元素 / add 后立即 has=true
			重复调用/幂等性
				重复 add 不增 size、不重复元素（SameValueZero）
			并发跨线程
				AsyncLock 实例 add
		has
			入参范围覆盖
				存在→true / 不存在→false（各类型）
				Unicode 多字符 / ±Infinity
			边界值测试
				空字符串 / null / undefined
				空集 has 任意→false
			返回值与类型验证
				boolean 类型 / true|false 断言
			组合场景
				add 后 has=true / delete 后 has=false / clear 后 has=false
				多参数 has（仅取首参）
			重复调用/幂等性
				多次重复 add 后 has 仍 true
			并发跨线程
				并发修改期间 has / AsyncLock 元素 has
		delete
			入参范围覆盖
				存在元素删除→true / 不存在→false（各类型）
				嵌套 Set/Map / AsyncLock / ConditionVariable / 科学计数法
			边界值测试
				空字符串 / null / undefined
				空集 delete→false
			返回值与类型验证
				boolean 返回值 true|false
			组合场景
				for...of 中 delete / 逆序 delete / delete 后 clear
				delete 后 size-1 且 has=false
				delete 已删元素→false
			重复调用/幂等性
				重复 delete 同元素→false
			并发跨线程
				并发遍历中 delete（10200201 触发）
		clear
			入参范围覆盖
				各类型元素 Set 清空后 size=0（number/string/boolean/BigInt）
			边界值测试
				空 Set clear 不抛错
				empty string / null / undefined / 空集
				嵌套 Set/Map / AsyncLock / ConditionVariable
			异常与非法输入
				forEach 回调内 clear → 10200201
				元素 getter 抛错时 clear 行为
			返回值与类型验证
				void / size→0 / 迭代器空
			组合场景
				clear 后可复用 add+has
				clear 后迭代器无元素
				clear 与 entries/keys/values 独立迭代器
			重复调用/幂等性
				多次 clear（其间 add）仍 size=0
			并发跨线程
				AsyncLock 元素 clear
		forEach
			入参范围覆盖
				单元素 / 多元素 / 全类型 key===value 语义
				@Sendable 类引用 / SendableEnum / 嵌套 Set
				AsyncLock / ConditionVariable / 科学计数法
			边界值测试
				空 Set 不执行回调
				empty string / null / undefined
				NaN / MAX_SAFE_INTEGER
			异常与非法输入
				回调抛错中断遍历
				回调内 add/delete/clear → 10200201
			返回值与类型验证
				插入顺序遍历 / key===value 不变式
				void 返回
		组合场景
			delete 再 add 同元素 → 访问两次
			遍历结果与 keys/values 一致
			thisArg 上下文绑定（@Sendable SetContext 闭包访问 tag + ESObject 方法 call 绑定）
			重复调用/幂等性
				重复值仅处理唯一值
			并发跨线程
				并发 forEach 遍历（多线程只读）
		entries
			入参范围覆盖
				[T,T] 键值对（各类型 / @Sendable 类引用）
				AsyncLock / 嵌套 Set / SendableEnum
			边界值测试
				空 Set → 空迭代器
				undefined / null key===value 不变式
				NaN / MAX_SAFE_INTEGER
			异常与非法输入
				非 sendable 绑定 → 10200011
				遍历中 add 不抛错（entries 返回独立迭代器）
			返回值与类型验证
				IterableIterator<[T,T]> 类型
				存在性与耗尽
			组合场景
				插入顺序 / for...of 遍历
				忽略传入参数
			重复调用/幂等性
				多次调用返回新独立迭代器
			并发跨线程
				并发修改 → 10200201
		keys
			入参范围覆盖
				各类型 T 迭代器（number/string/boolean/BigInt/emoji）
				@Sendable 类引用 / SendableEnum 值
				嵌套 collections.Set/Map / AsyncLock
			边界值测试
				空 Set → 空迭代器
				undefined / null
				NaN / MAX_SAFE_INTEGER
			异常与非法输入
				非 sendable 绑定 → 10200011
				遍历中 delete 不抛错（独立迭代器）
			返回值与类型验证
				IterableIterator<T> 类型
				与 values 等价序列
			组合场景
				插入顺序 / for...of / 部分迭代
				keys 与 values 一致序列
				Array.from(set.keys()/set.values()) 转换一致性（各类型/add/delete/clear 后/NaN/特殊数/null/undefined/混合类型/BigInt/Unicode/并发修改期间/for-of 与 has 组合/break 提前终止）
			重复调用/幂等性
				重复元素被忽略 / 多次增删后序列正确
			并发跨线程
				并发修改迭代 → 10200201
		values
			入参范围覆盖
				各类型 T 迭代器 / @Sendable 类复杂字段访问
				SendableClassExtended 引用 / SendableEnum
				嵌套 collections.Set 引用 / AsyncLock
			边界值测试
				空 Set → 空迭代器
				MAX_SAFE_INTEGER / NaN / ±Infinity
				empty string / null / undefined
			异常与非法输入
				非 sendable 绑定 → 10200011
				遍历中 clear 不抛错（独立迭代器）
			返回值与类型验证
				IterableIterator<T> 类型
				与 keys 等价
			组合场景
				插入顺序 / for...of / 部分迭代
				values 与 keys 等价性
				Array.from(set.keys()/set.values()) 转换一致性（同 keys 衍生场景）
			重复调用/幂等性
				重复元素过滤
			并发跨线程
				并发修改迭代 → 10200201
		[Symbol.iterator]
			入参范围覆盖
				for...of 遍历各类型（number/string/boolean/BigInt）
				特殊字符 / emoji / 科学计数法
				@Sendable 类 / SendableEnum
			边界值测试
				MAX_SAFE_INTEGER / NaN / ±0
				empty string / null / undefined
				空集 for...of 不执行
			异常与非法输入
				Symbol.iterator 非 sendable 绑定 → 10200011
			返回值与类型验证
				IterableIterator<T>
				for...of 与 values 等价结果
			组合场景
				Array 构造器配合（带 length/fill/unshift/join）
				break 提前终止 for...of
				插入顺序一致
			重复调用/幂等性
				多次 for...of 结果一致
			并发跨线程
				并发 for...of 完整性
	2. 稳定性（Stability）
		rehash / 容量扩张（1023/1024/1025 元素不丢、has 一致、NaN/±0 SameValueZero 跨 rehash、超长串 100000 存活、并发 rehash 期间 TaskPool 进度上报）
		错误恢复（10200201 后 Set 可复用断言）
		多轮幂等一致性（全接口 3 轮 deep-equal：add/delete/has/size/forEach/keys/values/entries/clear 返回值+状态跨轮 assertDeepEquals 比对；含 add(non-Sendable)→401 异常码跨轮一致）
	3. 性能（Performance）
		大集合规模断言（10000 元素大 Array / 1000 条目大 Map / forEach 遍历大集合 / 大 String Set entries 遍历）
		注：仅规模断言，无独立耗时/内存基线测度
	4. 并发安全（Concurrency Safety）
		并发只读遍历（forEach/keys/values/for-of 完整正确）
		并发修改触发 10200201 并恢复 size 正确
		Worker 接收/遍历/修改 Set 引用
		TaskPool 共享 Set 跨线程
		大集合并发遍历
	5. 兼容性与继承
		@Sendable 子类 extends collections.Set（自定义方法/重写 forEach/构造继承 values/泛型继承/多类型混合）
		instanceof 检测与原型链 / 多态 / 两级继承链
		子类实例跨 TaskPool 引用传递 / 多 TaskPool 共享同一子类实例
		@Sendable 装饰跨线程类型检查
		构造器接受 @Sendable 函数（SendableFuncType/SendableAsyncFnType）
	6. 资料与文档符合性
		SetBasic 文档示例（constructor/entries/keys/values/add/has/delete/clear/forEach/size 逐成员最小示例）
		CollectionsSetTest 综合功能矩阵（各类型 set/overwrite/链式/null/undefined/empty 边界/delete/clear 后/重复 key）
		注：CollectionsSetTest 描述沿用 Map 术语（"key-value pair"/"overwrite key"），与 Set 无键值语义存在表述偏差
