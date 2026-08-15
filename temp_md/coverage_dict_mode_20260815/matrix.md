# 来源覆盖率矩阵 — 字典模式触发场景

项目：`xts_acts_sendable_all727`
来源：`md/sendable/Sendable实战型测试设计-字典模式触发场景.md`（sha256 前16位 70ba95afd0191908，与 md/sendable动.rar 内条目 CRC 3D0BE70E 等价）
目标：`commonlibrary/ets_utils/concurrent_sendable/sendable_all_test/entry/src/ohosTest/ets/test/sendable/DictModeTriggerTest.test.ets`（27 it）
基线 HEAD（矩阵建立时）：a32c86b19c03c7f3ae255c3a2b4e1a742c71312b
来源总数：26
已验证覆盖：26
覆盖率：100%
状态：PASS_100（本来源文档；项目其余 18 份文档沿用 PR42639 留档 75% 债务口径，不在本次增量范围）

| 来源 ID | 来源条目 | 目标 it:行号 | 测试场景 | 状态 |
|---|---|---|---|---|
| SRC-DM-001 | §2.2 属性数=100 基础访问 | 0100:L270 | 正常/边界 | COVERED |
| SRC-DM-002 | §2.2 属性数=512 并发读取 | 0200:L291 | 并发 | COVERED |
| SRC-DM-003 | §2.2 属性数=1024 边界值 | 0300:L321 | 边界 | COVERED |
| SRC-DM-004 | §2.2 属性数=1025 超边界字典模式访问 | 0400:L341 | 边界 | COVERED |
| SRC-DM-005 | §2.2 属性数=2048 并发访问 | 0500:L362 | 并发/分批 | COVERED |
| SRC-DM-006 | §2.2 属性数=4096 极限值 | 0600:L390 | 边界/抽样 | COVERED |
| SRC-DM-007 | §2.1 可调属性数-同对象递增跨边界 | 1900:L647 (新增) | 边界转换/增长 | COVERED |
| SRC-DM-008 | §2.1 可调属性数-同对象回落跨边界 | 2000:L674 (新增) | 边界转换/回落 | COVERED |
| SRC-DM-009 | §2.1 可调属性数-边界震荡 | 2100:L703 (新增) | 边界转换/稳定性 | COVERED |
| SRC-DM-010 | §2.1 可调属性数-参数化扫描 | 2200:L732 (新增) | 参数化/跨线程 | COVERED |
| SRC-DM-011 | §2.3 场景7 跨线程传递1025属性对象 | 1500:L567 | 并发/跨线程 | COVERED |
| SRC-DM-012 | §3.2 Array 1024 边界 | 0700:L412 | 边界 | COVERED |
| SRC-DM-013 | §3.2 Array 1025 超边界 | 0800:L429 | 边界 | COVERED |
| SRC-DM-014 | §3.2 Array 并发push 2048 | 2300:L753 (新增) | 并发/分批/全量值校验 | COVERED |
| SRC-DM-015 | §3.2 Array 4096 遍历 | 1600:L585 | 边界/遍历 | COVERED |
| SRC-DM-016 | §3.3 Map 1024 边界 | 0900:L446 | 边界 | COVERED |
| SRC-DM-017 | §3.3 Map 1025 超边界 | 1000:L463 | 边界 | COVERED |
| SRC-DM-018 | §3.3 Map 并发读写 2048 | 2400:L794 (新增) | 并发/分批/读回验证 | COVERED |
| SRC-DM-019 | §3.3 Map 4096 删除 | 1700:L605 | 边界/删除 | COVERED |
| SRC-DM-020 | §3.1 Set 1024 边界 | 1100:L480 | 边界 | COVERED |
| SRC-DM-021 | §3.1 Set 1025 超边界 | 1200:L497 | 边界 | COVERED |
| SRC-DM-022 | §3.1 Set 大容量并发增删 | 2500:L837 (新增) | 并发/分批/增删 | COVERED |
| SRC-DM-023 | §4.1 场景1 1025属性×10轮并发增量(全量) | 2600:L884 (新增)；1300:L514 为缩小快路径 | 并发/全量校验 | COVERED |
| SRC-DM-024 | §4.2 场景2 前缀查找 | 2700:L922 (新增)；1400:L546 为get抽样补充 | 字典模式查找 | COVERED |
| SRC-DM-025 | §6.3 稳定性规则(分批/Promise.all/AsyncLock/抽样) | 0500/2300/2400/2500/2600 | 并发稳定性 | COVERED |
| SRC-DM-026 | §4.3 场景3 跨线程传递1025属性对象 | 1500:L567（md 示例即 taskpool 实现） | 并发/跨线程 | COVERED |
