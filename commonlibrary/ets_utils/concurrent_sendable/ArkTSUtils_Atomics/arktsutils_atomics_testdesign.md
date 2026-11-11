ArkTSUtils.Atomics 测试设计
	1. 接口测试（Functional）
		1.1 add(typedArray, index, value): number
			入参范围覆盖
				负值/零值/正值/大数/overflow/underflow/wraparound
				6 种 TypedArray（Int8/Uint8/Int16/Uint16/Int32/Uint32）
			边界值测试
				Uint8Array wraparound（255+1→0）
				Int32Array overflow（max+1→min）
				大索引/空数组边界
				非对齐 byteOffset 视图 add（SUP_ATOMICS_ALIGN_001）
			异常与非法输入
				null/undefined/非 SharedTypedArray → TypeError
				越界 index → RangeError
				detached SAB → ParameterError（SUP_ATOMICS_DETACH_001）
			返回值与类型验证
				返回操作前旧值
				ToInt32(value) 转换（NaN→0, Infinity 截断, 字符串→数字）
			组合场景
				add+load/sub/and/or/xor/exchange/compareExchange/store/isLockFree
			重复调用/幂等性
				同索引多次 add
				循环 add
			并发跨线程（→ §4）
		1.2 sub(typedArray, index, value): number
			（结构同 add，fetch_sub 返回旧值）
		1.3 and(typedArray, index, value): number
			（结构同 add，fetch_and 返回旧值）
		1.4 or(typedArray, index, value): number
			（结构同 add，fetch_or 返回旧值）
		1.5 xor(typedArray, index, value): number
			（结构同 add，fetch_xor 返回旧值；两次 XOR 回原值）
		1.6 exchange(typedArray, index, value): number
			（结构同 add，exchange 返回旧值；max↔min 翻转）
		1.7 compareExchange(typedArray, index, expectedValue, replacementValue): number
			入参范围覆盖
				匹配交换/不匹配保留
				全 6 TypedArray overflow/underflow
			边界值测试
				max↔min/0↔max/mid-range
			异常与非法输入
				TypeError + RangeError
				detached between expected/replacement（SUP_ATOMICS_DETACH_006）
			返回值与类型验证
				匹配：返回旧值且替换
				不匹配：返回当前值且不替换
			组合场景
				CAS 自增/重试/lock-relock/state machine
			重复调用/幂等性
				多次连续 CAS/同索引不同 expected
			并发跨线程（→ §4）
		1.8 load(typedArray, index): number
			入参范围覆盖
				6 种 TypedArray + async/箭头/Promise
			边界值测试
				零初值/中间索引
				max/min Int32/Int8（SUP_ATOMICS_LOAD_001-003）
				index=length-1（SUP_ATOMICS_LOAD_004）
			异常与非法输入
				TypeError + RangeError
				detached SAB（SUP_ATOMICS_DETACH_002）
			返回值与类型验证
				多次 load 一致性
			组合场景
				after and/or/add/xor/sub/store/exchange/compareExchange
			重复调用/幂等性
				多次一致性
			并发跨线程（→ §4）
		1.9 store(typedArray, index, value): number
			入参范围覆盖
				6 种 TypedArray + async/箭头/Promise
			边界值测试
				零值/Int8 范围
				max/min Int32（SUP_ATOMICS_STORE_001-002）
			异常与非法输入
				TypeError + RangeError
				detached SAB after ToInteger promote（SUP_ATOMICS_DETACH_003）
			返回值与类型验证
				返回 ToInteger 结果（非实际存储值）
				全 6 类型返回值 vs 实存值矩阵（SUP_ATOMICS_STORE_003-008）
				Uint8Array 257→返回 257 实存 1
				Int8Array 128→返回 128 实存 -128
			组合场景
				store+add/or/xor/exchange/CAS/sub/and
			重复调用/幂等性
				顺序/覆写/批量
			并发跨线程（→ §4）
		1.10 isLockFree(size): boolean
			入参范围覆盖
				1/2/4/8 字节 → true
				0/3/9/-1 → false
			边界值测试
				EPSILON/MIN_VALUE/MAX_VALUE/MAX_SAFE_INTEGER/MIN_SAFE_INTEGER
				-Infinity/NaN
			异常与非法输入
				null/undefined/boolean/object/array 强转
			返回值与类型验证
				boolean 返回 + 多次一致性
			组合场景
				isLockFree+add/CAS 序列
			重复调用/幂等性
				多次一致性
			规范偏差验证（源码缺陷 P0）
				2^32+1/2/4/8 → ToInt32 wrap 为 true（规范应 false）（SUP_ATOMICS_ISLOCKFREE_001-006）
		1.11 wait(typedArray, index, value, timeout?): 'ok'|'not-equal'|'timed-out'
			入参范围覆盖
				not-equal/ok/timed-out 三态
			边界值测试
				NaN/Infinity/fractional/negative/MAX_VALUE timeout
				timeout=0 + value 匹配 → timed-out
				Number.MAX_VALUE timeout（uint64 溢出验证）（SUP_ATOMICS_WAIT_006）
			异常与非法输入
				非 Int32Array → TypeError
				越界 index → RangeError
				GetAgentCanSuspend 检查（主线程不允许阻塞）（SUP_ATOMICS_WAIT_001-002）
				detached SAB（SUP_ATOMICS_DETACH_004）
			返回值与类型验证
				三种返回值字符串
				expected 截断 wrap to signed Int32
			组合场景
				wait+notify 跨 index
				wait 唤醒后 add+load
				wait+notify bounded queue 背压
				notify 先写新值再 notify（文档推荐模式）
			重复调用/幂等性
				同位置多次 wait
			并发跨线程（→ §4）
			稳定性验证
				worker terminate 期间 wait（UAF）（SUP_ATOMICS_WAIT_003-005）
				GC 期间 wait arrayHandle_ 稳定性（SUP_ATOMICS_WAIT_008-009）
		1.12 notify(typedArray, index, count?): number
			入参范围覆盖
				无 waiter → 返回 0
				唤醒 N waiter（count 精确）（SUP_ATOMICS_NOTIFY_002-004）
			边界值测试
				NaN/Infinity/fractional/零/负 count
			异常与非法输入
				非 Int32Array → TypeError
				越界 index → RangeError
				detached SAB（SUP_ATOMICS_DETACH_005）
				waiter backing detached 跳过（SUP_ATOMICS_DETACH_007）
			返回值与类型验证
				返回唤醒 agent 数
				count=0/-1 → 返回 0
				count=1.9 → 截断为 1
			组合场景
				notify+wait address isolation
				同 backing 不同视图 byteOffset alias
				不同 backing 不唤醒
				连续两次 notify（第二次 0 唤醒）
				先 store 新值再 notify
			重复调用/幂等性
				infinite count 重试唤醒
	2. 稳定性（Stability）
		Worker 终止期间 wait（UAF 验证）
			worker wait 无 timeout → terminate → 不崩溃（SUP_ATOMICS_WAIT_003）
			terminate 后 notify → 不 UAF（SUP_ATOMICS_WAIT_004）
			多 worker 部分 terminate → 其余正常唤醒（SUP_ATOMICS_WAIT_005）
		非对齐 byteOffset RMW
			Int32Array byteOffset=1/2/3/4 add/load/exchange（SUP_ATOMICS_ALIGN_001-005）
		Wait 超时溢出
			Number.MAX_VALUE / MAX_SAFE_INTEGER timeout 不崩溃（SUP_ATOMICS_WAIT_006-007）
		GC 期间 wait
			arrayHandle_ slot 稳定性（SUP_ATOMICS_WAIT_008-009）
		Detached SAB 全接口
			12 接口 detached 路径不崩溃（SUP_ATOMICS_DETACH_001-007，需 NAPI）
		疲劳测试
			10000 次循环全接口（SUP_ATOMICS_FUZZ_004）
			全 6 类型 1000 次循环（SUP_ATOMICS_FUZZ_005）
	3. 性能（Performance）
		（现有 ApiThirdly 记录耗时不断言，建议补充耗时阈值断言）
	4. 并发安全（Concurrency Safety）
		100 worker 并发 add 同一索引（SUP_ATOMICS_FUZZ_001）
		混合 RMW 并发 fuzz（SUP_ATOMICS_FUZZ_002）
		wait/notify 50 worker 压力（SUP_ATOMICS_FUZZ_003）
		compareExchange CAS 自旋压力（SUP_ATOMICS_FUZZ_006）
		现有覆盖
			taskpool 跨任务原子（FunctionTest）
			worker 双 worker 共享 ArrayBuffer（MultithreadTest）
			矩阵乘 CAS 重试（ConcurrentTest）
			bounded queue wait/notify 背压（ConcurrentTest）
	5. 兼容性与继承（Compatibility & Inheritance）
		拒绝 ordinary TypedArray（EntryTest ✅）
		forward sendable（EntryTest ✅）
		保留 global Atomics（EntryTest ✅）
		ExtendedAtomics 静态子类继承（ApiThirdlyTest0001，仅 exchange）
		6 种 TypedArray width signedness/modulo 转换（ParameterTest ✅）
	6. 资料与文档符合性（Doc Conformance）
		文档示例逐句验证（SUP_ATOMICS_DOC_001-006）
			add/and/or/xor/sub/exchange/load/store/compareExchange/wait/notify/isLockFree
		store 返回值 vs 实存值（文档 Uint8Array 257 示例 → 全类型矩阵）
		wait "调用线程必须允许阻塞等待"（GetAgentCanSuspend）
		notify "同一底层缓冲区的同一字节位置"（address isolation + byteOffset alias）
		isLockFree "按32位整数转换"（ToInt32 vs ToIntegerOrInfinity 规范确认）
