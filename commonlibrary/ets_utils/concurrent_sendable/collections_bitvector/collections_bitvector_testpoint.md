# BitVector 最终测试点报告

## 文件清单
| # | 文件 | 活跃用例 | 注释用例 | 总计 |
|---|------|---------|---------|------|
| 1 | BitVectorConstructor.test.ets | 29 | 0 | 29 |
| 2 | BitVectorPush.test.ets | 40 | 0 | 40 |
| 3 | BitVectorPop.test.ets | 25 | 0 | 25 |
| 4 | BitVectorHas.test.ets | 53 | 6 | 59 |
| 5 | BitVectorSetBitsByRange.test.ets | 48 | 0 | 48 |
| 6 | BitVectorSetAllBits.test.ets | 25 | 0 | 25 |
| 7 | BitVectorGetBitsByRange.test.ets | 36 | 0 | 36 |
| 8 | BitVectorGetBitCountByRange.test.ets | 56 | 0 | 56 |
| 9 | BitVectorResize.test.ets | 25 | 5 | 30 |
| 10 | BitVectorGetIndexOf.test.ets | 43 | 0 | 43 |
| 11 | BitVectorGetLastIndexOf.test.ets | 42 | 0 | 42 |
| 12 | BitVectorFlipBitByIndex.test.ets | 34 | 0 | 34 |
| 13 | BitVectorFlipBitsByRange.test.ets | 45 | 0 | 45 |
| 14 | BitVectorValues.test.ets | 45 | 0 | 45 |
| 15 | BitVectorIndexAccess.test.ets | 22 | 0 | 22 |
| 16 | BitVectorUnbound.test.ets | 31 | 0 | 31 |
| 17 | BitVectorConcurrentSingle.test.ets | 8 | 0 | 8 |
| 18 | BitVectorConcurrentMulti.test.ets | 7 | 0 | 7 |
| **合计** | **18个文件** | **620** | **11** | **631** |

---

## 1. BitVectorConstructor.test.ets (29用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_001 | BitVector_constructor_Func_001 | constructor | 无 | length=10构造，验证length=10 |
| 2 | BITVECTOR_TEST_078 | BitVector_constructor_Func_002 | constructor | 无 | 字符串类型参数(JSON转换)，抛出401 |
| 3 | SUB_COLLECTIONS_BITVECTOR_TEST_0100 | BitVectorTest0100 | constructor | 无 | length=0构造，验证length=0 |
| 4 | SUB_COLLECTIONS_BITVECTOR_TEST_0200 | BitVectorTest0200 | constructor | 无 | 多种正常数值(1,8,1024)构造，验证length |
| 5 | SUB_COLLECTIONS_BITVECTOR_TEST_0300 | BitVectorTest0300 | constructor | 无 | 大长度1000000构造，验证length |
| 6 | SUB_COLLECTIONS_BITVECTOR_TEST_0400 | BitVectorTest0400 | constructor | 无 | 浮点数10.5参数，抛出401 |
| 7 | SUB_COLLECTIONS_BITVECTOR_TEST_0500 | BitVectorTest0500 | constructor | 无 | 负数-1参数行为验证 |
| 8 | SUB_COLLECTIONS_BITVECTOR_TEST_0600 | BitVectorTest0600 | constructor | 无 | NaN参数，抛出401 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_0700 | BitVectorTest0700 | constructor | 无 | Infinity参数，抛出401 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_0800 | BitVectorTest0800 | constructor | 无 | -Infinity参数，抛出401 |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_0900 | BitVectorTest0900 | constructor | new BitVector(16) | 构造后所有位默认为0 |
| 12 | SUB_COOLLECTION_BITVECTOR_0100 | BitVectortest0100 | constructor | 无 | NaN参数抛出401 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1000 | testBitVectorConstructor0001 | constructor | 无 | length=-1，length=0(容错) |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1010 | testBitVectorConstructor0002 | constructor | 无 | length=0，验证length=0 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1020 | testBitVectorConstructor0003 | constructor | 无 | length=10，验证length=10 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1030 | testBitVectorConstructor0004 | constructor | 无 | length=100000，验证length |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1040 | testBitVectorConstructor0008 | constructor | 无 | NaN参数，抛出401 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1050 | testBitVectorConstructor0009 | constructor | 无 | Infinity参数，抛出401 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1060 | testBitVectorConstructor0010 | constructor | 无 | -Infinity参数，抛出401 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1070 | testBitVectorConstructor0012 | constructor | 无 | 浮点0.5参数，抛出401 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1080 | testBitVectorConstructor0013 | constructor | new BitVector(10) | 实例类型验证，instanceof及typeof |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4410 | testBitVectorContainerSizeBoundary0001 | constructor | 无 | size=0空容器，length=0 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5000 | testBitVectorConstructorCapacity0001 | constructor | new BitVector(64) | capacity=64，验证length及元素为0 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5010 | testBitVectorConstructorCapacity0002 | constructor+setAllBits | new BitVector(64) | capacity=64，setAllBits(1)再(0)验证 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5020 | testBitVectorConstructorCapacity0003 | constructor+push | new BitVector(64) | capacity=64，push(1)跨word边界 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5030 | testBitVectorConstructorCapacity0004 | constructor+resize | new BitVector(64) | capacity=64，resize(65)跨word边界 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5040 | testBitVectorConstructorCapacity0005 | constructor+setAllBits | new BitVector(128) | capacity=128，验证边界值 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5050 | testBitVectorConstructorCapacity0006 | constructor+setAllBits | new BitVector(1024) | capacity=1024，验证边界值 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5060 | testBitVectorConstructorCapacity0007 | constructor+setAllBits | new BitVector(1025) | capacity=1025，跨1024边界 |

---

## 2. BitVectorPush.test.ets (40用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_002 | BitVector_push_Func_001 | push | new BitVector(0) | push 5次(0,1,0,1,1)，验证true和length=5 |
| 2 | BITVECTOR_TEST_003 | BitVector_push_Func_002 | push | new BitVector(0) | push 64次0，验证length=64 |
| 3 | BITVECTOR_TEST_004 | BitVector_push_Func_003 | push | new BitVector(10) | 已有10元素push 64次，length=74 |
| 4 | BITVECTOR_TEST_079 | BitVector_push_Func_004 | push | new BitVector(0) | push非零值(NaN,Inf,-2,-4,5,0)，验证存储 |
| 5 | SUB_COLLECTIONS_BITVECTOR_TEST_1000 | BitVectorTest1000 | push+pop+resize | new BitVector(16) | push/pop/resize后length变化 |
| 6 | SUB_COLLECTIONS_BITVECTOR_TEST_1100 | BitVectorTest1100 | push | new BitVector(8) | push(0)和(1)验证位值 |
| 7 | SUB_COLLECTIONS_BITVECTOR_TEST_1200 | BitVectorTest1200 | push | new BitVector(8) | push(2)和(-1)验证位值=1 |
| 8 | SUB_COLLECTIONS_BITVECTOR_TEST_1300 | BitVectorTest1300 | push | new BitVector(8) | push NaN和Infinity，验证length |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_1400 | BitVectorTest1400 | push | new BitVector(8) | push返回boolean类型验证 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_1500 | BitVectorTest1500 | push | new BitVector(0) | 空BV push(1)，返回true、length=1、值=1 |
| 11 | BitVectortest0200 | BitVectortest0200 | push | new BitVector(5) | 解绑push调用，抛出10200011 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1090 | testBitVectorPush0001 | push | new BitVector(0) | push(0)，返回true和值=0 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1100 | testBitVectorPush0002 | push | new BitVector(0) | push(1)，返回true和值=1 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1110 | testBitVectorPush0003 | push | new BitVector(0) | push(-1)，值=1 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1120 | testBitVectorPush0004 | push | new BitVector(0) | push(65535)，值=1 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1130 | testBitVectorPush0005 | push | new BitVector(0) | push(-65535)，值=1 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1140 | testBitVectorPush0006 | push | new BitVector(0) | push(2.5)浮点，值=1 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1150 | testBitVectorPush0007 | push | new BitVector(0) | push 10次1，length=10 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1160 | testBitVectorPush0008 | push | new BitVector(0) | push 1000次0/1交替，length=2000 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1170 | testBitVectorPush0010 | push | new BitVector(0) | 额外参数测试，length=1 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1180 | testBitVectorPush0018 | push | new BitVector(0) | 返回值类型boolean验证 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3900 | testBitVectorPushBoundary0001 | push | new BitVector(0) | 空BV push(1)，length变1 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3970 | testBitVectorPushValueBoundary0001 | push | new BitVector(0) | push(0)存储为0 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3980 | testBitVectorPushValueBoundary0002 | push | new BitVector(0) | push(-1)存储为1 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3990 | testBitVectorPushValueBoundary0003 | push | new BitVector(0) | push(2)存储为1 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4000 | testBitVectorPushValueBoundary0004 | push | new BitVector(0) | push(65535)存储为1 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4010 | testBitVectorPushValueBoundary0005 | push | new BitVector(0) | push(-65535)存储为1 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4020 | testBitVectorPushValueBoundary0006 | push | new BitVector(0) | push(MAX_SAFE_INTEGER)存储为1 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4030 | testBitVectorPushValueBoundary0007 | push | new BitVector(0) | push(MIN_SAFE_INTEGER)存储为1 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4040 | testBitVectorPushValueBoundary0008 | push | new BitVector(0) | push(0.5)存储为1 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4050 | testBitVectorPushValueBoundary0009 | push | new BitVector(0) | push(-0.5)存储为1 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4060 | testBitVectorPushValueBoundary0010 | push | new BitVector(0) | push混合值，验证存储正确 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4580 | testBitVectorRepeatCall0001 | push | new BitVector(0) | 重复push 10次，验证length和值 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4680 | testBitVector64Boundary0001 | push | new BitVector(0) | 64边界：push 64个元素，验证全部值 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4690 | testBitVector64Boundary0002 | push | new BitVector(0) | 64边界：push 65个跨word边界 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4830 | testBitVector128Boundary0001 | push | new BitVector(0) | 128边界：push 128个元素 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4840 | testBitVector128Boundary0002 | push | new BitVector(0) | 128边界：push 129个跨边界 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4930 | testBitVector1024Boundary0001 | push | new BitVector(0) | 1024边界：push 1024个元素 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4940 | testBitVector1024Boundary0002 | push | new BitVector(0) | 1024边界：push 1025个跨边界 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5080 | testBitVectorConstructorNonBinaryValue0002 | push+getBitCountByRange | new BitVector(0) | push非0/1值+getBitCountByRange验证 |

---

## 3. BitVectorPop.test.ets (25用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_005 | BitVector_pop_Func_001 | pop | new BitVector(0)+push 5 | 连续pop 5次，验证LIFO和length=0 |
| 2 | BITVECTOR_TEST_006 | BitVector_pop_Func_002 | pop | new BitVector(0)+push 64 | pop 64次，返回0和length=0 |
| 3 | BITVECTOR_TEST_007 | BitVector_pop_Func_003 | pop | new BitVector(10)+push 64 | 已有10元素pop 64次，length=10 |
| 4 | SUB_COLLECTIONS_BITVECTOR_TEST_1600 | BitVectorTest1600 | pop | new BitVector(8)+push 2 | pop返回LIFO顺序和number类型 |
| 5 | SUB_COLLECTIONS_BITVECTOR_TEST_1700 | BitVectorTest1700 | pop | new BitVector(0) | 空BV pop行为验证 |
| 6 | SUB_COLLECTIONS_BITVECTOR_TEST_1800 | BitVectorTest1800 | pop | new BitVector(4)+[3]=1 | 索引赋值后pop，返回1和length=3 |
| 7 | SUB_COOLLECTION_BITVECTOR_0400 | BitVectortest0400 | pop | new BitVector(3) | 解绑pop调用，抛出10200011 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1190 | testBitVectorPop0001 | pop | new BitVector(0)+push 10 | pop 10次，返回1 |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1200 | testBitVectorPop0002 | pop | new BitVector(10000) | pop 10000次，返回0 |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1210 | testBitVectorPop0003 | pop | new BitVector(0)+push 3 | pop成功，返回值(0,1,1) |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1220 | testBitVectorPop0004 | pop | new BitVector(0)+push 3 | pop成功并验证length |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1230 | testBitVectorPop0005 | pop | new BitVector(0) | 空BV pop返回undefined |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1240 | testBitVectorPop0006 | pop | new BitVector(0)+push 2 | 无参数调用pop |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1250 | testBitVectorPop0007 | pop | new BitVector(0)+push 2 | 额外参数pop应忽略 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1260 | testBitVectorPop0008 | pop | new BitVector(0)+push 2 | 返回值类型number |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1270 | testBitVectorPop0009 | pop | new BitVector(0)+push 2 | 返回值为0或1 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1280 | testBitVectorPop0010 | pop | new BitVector(0)+push 2 | pop后再push操作 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1290 | testBitVectorPop0011 | pop | new BitVector(0) | 交替push和pop操作 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1300 | testBitVectorPop0012 | pop | new BitVector(0)+push 1 | 单元素pop后变空，再pop返回undefined |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1310 | testBitVectorPop0013 | pop | new BitVector(0)+push 3 | pop后索引访问验证 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1320 | testBitVectorPop0014 | pop | new BitVector(0)+push 4 | pop后迭代器遍历验证 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1330 | testBitVectorPop0015 | pop | new BitVector(0)+push 3 | pop后length变化验证 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3910 | testBitVectorPopBoundary0001 | pop | new BitVector(0)+push 1 | 单元素pop后length=0，再pop返回undefined |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3920 | testBitVectorPopBoundary0002 | pop | new BitVector(0)+push 2 | pop至空后再push验证 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4590 | testBitVectorRepeatCall0002 | pop | new BitVector(0)+push 5 | 重复pop 5次，验证变空 |

---

## 4. BitVectorHas.test.ets (53活跃+6注释=59总计)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_008 | BitVector_has_Func_001 | has | new BitVector(0)+push 6 | has查询1和0在不同范围 |
| 2 | BITVECTOR_TEST_009 | BitVector_has_Func_002 | has | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_010 | BitVector_has_Func_003 | has | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 4 | BITVECTOR_TEST_011 | BitVector_has_Func_004 | has | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_012 | BitVector_has_Func_005 | has | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 6 | BITVECTOR_TEST_013 | BitVector_has_Func_006 | has | new BitVector(0)+push 64 | 64元素跨word边界has查询 |
| 7 | BITVECTOR_TEST_014 | BitVector_has_Func_007 | has | new BitVector(10)+push 64 | 74元素has查询跨word边界 |
| 8 | BITVECTOR_TEST_077 | BitVector_has_Func_008 | has | new BitVector(0)+push 20 | 20元素has查询不同范围 |
| 9 | BITVECTOR_TEST_080 | BitVector_has_Func_009 | has | new BitVector(0)+push 6 | 非零元素(-3,7,NaN)查询 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_1900 | BitVectorTest1900 | has | new BitVector(16)+[5]=1 | 查询0和非零元素(2) |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_2000 | BitVectorTest2000 | has | new BitVector(16)+[5,10]=1 | 不同索引范围查询返回正确结果 |
| 12 | SUB_COLLECTIONS_BITVECTOR_TEST_2100 | BitVectorTest2100 | has | new BitVector(16)+[0,15]=1 | 边界索引(起始和末尾)查询 |
| 13 | SUB_COLLECTIONS_BITVECTOR_TEST_2200 | BitVectorTest2200 | has | new BitVector(16) | fromIndex=-1，抛出10200001 |
| 14 | SUB_COLLECTIONS_BITVECTOR_TEST_2300 | BitVectorTest2300 | has | new BitVector(16) | toIndex=17超长度，抛出10200001 |
| 15 | SUB_COLLECTIONS_BITVECTOR_TEST_2400 | BitVectorTest2400 | has | new BitVector(16) | fromIndex=toIndex=8，抛出10200001 |
| 16 | SUB_COLLECTIONS_BITVECTOR_TEST_2500 | BitVectorTest2500 | has | new BitVector(16)+[5,10]=1 | 多种值和范围组合查询 |
| 17 | SUB_COLLECTIONS_BITVECTOR_TEST_2600 | BitVectorTest2600 | has | new BitVector(16) | fromIndex>toIndex(10>5)，抛出10200001 |
| 18 | SUB_COOLLECTION_BITVECTOR_0600 | BitVectortest0600 | has | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 19 | SUB_COOLLECTION_BITVECTOR_0700 | BitVectortest0700 | has | new BitVector(0)+push 5 | 解绑has调用，抛出10200011 |
| 20 | SUB_COOLLECTION_BITVECTOR_0900 | BitVectortest0900 | has | new BitVector(0)+push 5 | 浮点索引(1.5,3.5)，抛出401 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1340 | testBitVectorHas0001 | has | new BitVector(0)+push 10 | element=0范围0-10，返回true |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1350 | testBitVectorHas0002 | has | new BitVector(0)+push 10 | element=0范围0-5，返回true |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1360 | testBitVectorHas0003 | has | new BitVector(0)+push 10 | element=1范围0-4，返回false |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1370 | testBitVectorHas0004 | has | new BitVector(0)+push 10 | element=1范围0-10，返回true |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1380 | testBitVectorHas0005 | has | new BitVector(0)+push 10 | fromIndex=-1，抛出范围错误 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1390 | testBitVectorHas0006 | has | new BitVector(0)+push 10 | toIndex=11超长度，抛出范围错误 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1400 | testBitVectorHas0007 | has | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)，抛出范围错误 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1410 | testBitVectorHas0008 | has | new BitVector(0)+push 10 | fromIndex=toIndex=5，抛出范围错误 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1420 | testBitVectorHas0010 | has | new BitVector(0)+push 3 | 单参数has测试 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1430 | testBitVectorHas0011 | has | new BitVector(0)+push 4 | 两参数has测试 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1440 | testBitVectorHas0012 | has | new BitVector(0)+push 3 | 额外参数has测试 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1450 | testBitVectorHas0018 | has | new BitVector(5) | fromIndex=NaN，抛出401 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1460 | testBitVectorHas0019 | has | new BitVector(5) | fromIndex=浮点1.5，抛出401 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1470 | testBitVectorHas0020 | has | new BitVector(0) | 空BV has(0,0,0)，抛出10200001 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1480 | testBitVectorHas0021 | has | new BitVector(0)+push 3 | 返回值类型boolean验证 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1490 | testBitVectorHas0022 | has | new BitVector(0)+push 3 | element=正数2查询 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1500 | testBitVectorHas0023 | has | new BitVector(0)+push 3 | element=负数-1查询 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3380 | testBitVectorHasBoundary0001 | has | new BitVector(0)+push 3 | toIndex=length，元素不存在返回false |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3400 | testBitVectorHasBoundary0003 | has | new BitVector(0)+push 5 | toIndex=length，元素存在返回true |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3410 | testBitVectorHasBoundary0004 | has | new BitVector(0)+push 10个0 | 全0数组toIndex=length查1返回false |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3430 | testBitVectorHasBoundary0006 | has | new BitVector(0)+push 3 | fromIndex=length-1 toIndex=length末尾存在 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3440 | testBitVectorHasBoundary0007 | has | new BitVector(0)+push 3 | fromIndex=length-1 toIndex=length末尾不存在 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3450 | testBitVectorHasBoundary0008 | has | new BitVector(0)+push 3 | fromIndex=0 toIndex=1首元素存在 |
| 44 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3460 | testBitVectorHasBoundary0009 | has | new BitVector(0)+push 3 | fromIndex=0 toIndex=1，index 1处存在 |
| 45 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3470 | testBitVectorHasBoundary0010 | has | new BitVector(0)+push 100个0 | 大BV全0查1返回false |
| 46 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3490 | testBitVectorHasBoundary0012 | has | new BitVector(0)+push 1 | 单元素toIndex=length存在和不存在 |
| 47 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4070 | testBitVectorHasPatternBoundary0001 | has | new BitVector(0)+push 10个0 | 全0模式：has(0)=true,has(1)=false |
| 48 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4110 | testBitVectorHasPatternBoundary0005 | has | new BitVector(0)+push 10(0,1交替) | 交替0,1模式：has(0)=true,has(1)=true |
| 49 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4120 | testBitVectorHasPatternBoundary0006 | has | new BitVector(0)+push 10(1,0交替) | 交替1,0模式：has(0)=true,has(1)=true |
| 50 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4130 | testBitVectorHasPatternBoundary0007 | has | new BitVector(0)+push 9个0+1个1 | 全0中单个1：has(1)=true,has(0)=true |
| 51 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4140 | testBitVectorHasPatternBoundary0008 | has | new BitVector(0)+push 9个1+1个0 | 全1中单个0：has(0)=true,has(1)=true |
| 52 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4490 | testBitVectorEmptyBoundary0001 | has | new BitVector(0) | 空BV has(0,0,0)抛出10200001 |
| 53 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4760 | testBitVector64Boundary0009 | has | new BitVector(0)+push 65 | 64边界：跨64边界has(范围60-65) |
| 54(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3390 | testBitVectorHasBoundary0002 | has | new BitVector(0)+push 3个1 | toIndex=length全1查0返回false |
| 55(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3420 | testBitVectorHasBoundary0005 | has | new BitVector(0)+push 10个1 | 全1数组toIndex=length查0返回false |
| 56(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3480 | testBitVectorHasBoundary0011 | has | new BitVector(0)+push 100个1 | 大BV全1查0返回false |
| 57(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4080 | testBitVectorHasPatternBoundary0002 | has | new BitVector(0)+push 10个1 | 全1模式：has(1)=true,has(0)=false |
| 58(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4090 | testBitVectorHasPatternBoundary0003 | has | new BitVector(0)+push 10个-1 | 全-1模式(按1)：has(1)=true,has(0)=false |
| 59(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4100 | testBitVectorHasPatternBoundary0004 | has | new BitVector(0)+push 10个2 | 全2模式(按1)：has(1)=true,has(0)=false |

---

## 5. BitVectorSetBitsByRange.test.ets (48用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_015 | BitVector_setBitsByRange_Func_001 | setBitsByRange | new BitVector(0)+push 5 | 范围设置0和1，验证位值变化 |
| 2 | BITVECTOR_TEST_016 | BitVector_setBitsByRange_Func_002 | setBitsByRange | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_017 | BitVector_setBitsByRange_Func_003 | setBitsByRange | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 4 | BITVECTOR_TEST_018 | BitVector_setBitsByRange_Func_004 | setBitsByRange | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_019 | BitVector_setBitsByRange_Func_005 | setBitsByRange | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 6 | BITVECTOR_TEST_020 | BitVector_setBitsByRange_Func_006 | setBitsByRange | new BitVector(0)+push 64 | 64元素跨word边界setBitsByRange |
| 7 | BITVECTOR_TEST_021 | BitVector_setBitsByRange_Func_007 | setBitsByRange | new BitVector(10)+push 64 | 74元素setBitsByRange跨word边界 |
| 8 | BITVECTOR_TEST_081 | BitVector_setBitsByRange_Func_008 | setBitsByRange | new BitVector(0)+push 5 | 字符串类型fromIndex，抛出401 |
| 9 | BITVECTOR_TEST_082 | BitVector_setBitsByRange_Func_009 | setBitsByRange | new BitVector(2) | toIndex=3超长度，抛出10200001 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_2700 | BitVectorTest2700 | setBitsByRange | new BitVector(16) | 范围5-10设为1，验证值正确 |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_2800 | BitVectorTest2800 | setBitsByRange | new BitVector(16) | 元素0和非零值2设置验证 |
| 12 | SUB_COLLECTIONS_BITVECTOR_TEST_2900 | BitVectorTest2900 | setBitsByRange | new BitVector(16) | 边界索引(0-1和15-16)设置 |
| 13 | SUB_COLLECTIONS_BITVECTOR_TEST_3000 | BitVectorTest3000 | setBitsByRange | new BitVector(16) | fromIndex=-1，抛出10200001 |
| 14 | SUB_COLLECTIONS_BITVECTOR_TEST_3100 | BitVectorTest3100 | setBitsByRange | new BitVector(16) | 返回void(undefined)验证 |
| 15 | SUB_COLLECTIONS_BITVECTOR_TEST_3200 | BitVectorTest3200 | setBitsByRange | new BitVector(16) | toIndex=17超长度，抛出10200001 |
| 16 | SUB_COLLECTIONS_BITVECTOR_TEST_3300 | BitVectorTest3300 | setBitsByRange | new BitVector(16) | fromIndex=toIndex=8，抛出10200001 |
| 17 | SUB_COOLLECTION_BITVECTOR_01000 | BitVectortest01000 | setBitsByRange | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 18 | SUB_COOLLECTION_BITVECTOR_01100 | BitVectortest01100 | setBitsByRange | new BitVector(0)+push 5 | NaN参数，抛出401 |
| 19 | SUB_COOLLECTION_BITVECTOR_01200 | BitVectortest01200 | setBitsByRange | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1510 | testBitVectorSetBitsByRange0001 | setBitsByRange+has | new BitVector(0)+push 10个0 | 设范围5-10为1，has验证 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1520 | testBitVectorSetBitsByRange0002 | setBitsByRange+has | new BitVector(0)+push 10个0 | 设范围5-10为1，has(0,0,5)验证 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1530 | testBitVectorSetBitsByRange0003 | setBitsByRange+has | new BitVector(0)+push 10个0 | 设范围5-10为1，has(1,0,4)返回false |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1540 | testBitVectorSetBitsByRange0004 | setBitsByRange+has | new BitVector(0)+push 10个0 | 设范围5-10为1，has(1,0,10)返回true |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1550 | testBitVectorSetBitsByRange0005 | setBitsByRange+has | new BitVector(0)+push 10个0 | setBitsByRange后has(-1,0,10)抛出范围错误 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1560 | testBitVectorSetBitsByRange0006 | setBitsByRange+has | new BitVector(0)+push 10个0 | setBitsByRange后has(0,0,11)抛出范围错误 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1570 | testBitVectorSetBitsByRange0007 | setBitsByRange+has | new BitVector(0)+push 10个0 | setBitsByRange后has(5,4)抛出范围错误 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1580 | testBitVectorSetBitsByRange0008 | setBitsByRange+has | new BitVector(0)+push 10个0 | setBitsByRange后has(5,5)抛出范围错误 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1590 | testBitVectorSetBitsByRange0009 | setBitsByRange | new BitVector(0)+push 10 | 设范围1-3为1，验证值变化 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1600 | testBitVectorSetBitsByRange0011 | setBitsByRange | new BitVector(0)+push 3 | 额外参数测试 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1610 | testBitVectorSetBitsByRange0014 | setBitsByRange | new BitVector(0)+push 3 | 负数fromIndex，抛出10200001 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1620 | testBitVectorSetBitsByRange0015 | setBitsByRange | new BitVector(0)+push 3 | toIndex超长度，抛出10200001 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1630 | testBitVectorSetBitsByRange0016 | setBitsByRange | new BitVector(0)+push 3 | fromIndex>toIndex，抛出10200001 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1640 | testBitVectorSetBitsByRange0018 | setBitsByRange | new BitVector(0)+push 5 | 全范围设为1，验证返回void |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1650 | testBitVectorSetBitsByRange0019 | setBitsByRange | new BitVector(0)+push 100个0 | 大范围(100元素)设置 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3500 | testBitVectorSetBitsByRangeBoundary0001 | setBitsByRange | new BitVector(0)+push 5个0 | 全范围fromIndex=0 toIndex=length |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3510 | testBitVectorSetBitsByRangeBoundary0002 | setBitsByRange | new BitVector(0)+push 5个0 | 仅末尾元素fromIndex=length-1 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3520 | testBitVectorSetBitsByRangeBoundary0003 | setBitsByRange | new BitVector(0)+push 5个0 | 仅首元素fromIndex=0 toIndex=1 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3530 | testBitVectorSetBitsByRangeBoundary0004 | setBitsByRange | new BitVector(0)+push 5个1 | 全1数组设0 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3540 | testBitVectorSetBitsByRangeBoundary0005 | setBitsByRange | new BitVector(0)+push 1 | 单元素全范围设置 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4380 | testBitVectorSetBitsByRangeValueBoundary0001 | setBitsByRange | new BitVector(0)+push 5个0 | 非零值-1设置全部变1 |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4390 | testBitVectorSetBitsByRangeValueBoundary0002 | setBitsByRange | new BitVector(0)+push 5个0 | 非零值2设置全部变1 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4400 | testBitVectorSetBitsByRangeValueBoundary0003 | setBitsByRange | new BitVector(0)+push 5个0 | 非零值65535设置全部变1 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4500 | testBitVectorEmptyBoundary0002 | setBitsByRange | new BitVector(0) | 空BV setBitsByRange(1,0,0)抛出10200001 |
| 44 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4600 | testBitVectorRepeatCall0003 | setBitsByRange | new BitVector(0)+push 10个0 | 重复调用3次不同范围 |
| 45 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4720 | testBitVector64Boundary0005 | setBitsByRange | new BitVector(0)+push 65个0 | 64边界：跨64边界设置(范围60-65) |
| 46 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4870 | testBitVector128Boundary0005 | setBitsByRange | new BitVector(0)+push 129个0 | 128边界：跨128边界设置(范围125-129) |
| 47 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4970 | testBitVector1024Boundary0005 | setBitsByRange+flipBitsByRange | new BitVector(0)+push 1025个0 | 1024边界：跨边界设置+翻转 |
| 48 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5070 | testBitVectorConstructorNonBinaryValue0001 | setBitsByRange | new BitVector(64) | 非二进制值(-1,2,65535)设置验证存储为1 |

---

## 6. BitVectorSetAllBits.test.ets (25用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_074 | BitVector_setAllBits_Func_001 | setAllBits | new BitVector(0)+push 5个1 | setAllBits(0)再(1)验证 |
| 2 | BITVECTOR_TEST_075 | BitVector_setAllBits_Func_002 | setAllBits | new BitVector(0)+push 64个0 | 64元素setAllBits(1)再(0)验证 |
| 3 | BITVECTOR_TEST_076 | BitVector_setAllBits_Func_003 | setAllBits | new BitVector(10)+push 64个0 | 74元素setAllBits验证 |
| 4 | SUB_COLLECTIONS_BITVECTOR_TEST_3400 | BitVectorTest3400 | setAllBits | new BitVector(16) | setAllBits(0,1,2)验证所有位 |
| 5 | SUB_COLLECTIONS_BITVECTOR_TEST_3500 | BitVectorTest3500 | setAllBits | new BitVector(16) | 负数-1设置所有位变1 |
| 6 | SUB_COLLECTIONS_BITVECTOR_TEST_3600 | BitVectorTest3600 | setAllBits | new BitVector(16) | 返回void(undefined)验证 |
| 7 | SUB_COOLLECTION_BITVECTOR_01400 | BitVectortest01400 | setAllBits | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1660 | testBitVectorSetAllBits0001 | setAllBits | new BitVector(0)+push 10 | set(0)全部变0 |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1670 | testBitVectorSetAllBits0002 | setAllBits | new BitVector(0)+push 10 | set(1)全部变1 |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1680 | testBitVectorSetAllBits0003 | setAllBits | new BitVector(0)+push 10 | set(-1)全部变1 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1690 | testBitVectorSetAllBits0004 | setAllBits | new BitVector(0)+push 10 | set(65535)全部变1 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1700 | testBitVectorSetAllBits0005 | setAllBits | new BitVector(0)+push 10 | set(2.5)浮点全部变1 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1710 | testBitVectorSetAllBits0007 | setAllBits | new BitVector(0)+push 3个0 | 额外参数测试 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1720 | testBitVectorSetAllBits0015 | setAllBits | new BitVector(0)+push 1000 | 返回void验证+大BV测试 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3930 | testBitVectorSetAllBitsBoundary0001 | setAllBits | new BitVector(0) | 空BV setAllBits，length保持0 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3940 | testBitVectorSetAllBitsBoundary0002 | setAllBits | new BitVector(0)+push 1 | 单元素BV setAllBits |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4340 | testBitVectorSetAllBitsValueBoundary0001 | setAllBits | new BitVector(0)+push 5个0 | setAllBits(-1)全部变1 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4350 | testBitVectorSetAllBitsValueBoundary0002 | setAllBits | new BitVector(0)+push 5个0 | setAllBits(2)全部变1 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4360 | testBitVectorSetAllBitsValueBoundary0003 | setAllBits | new BitVector(0)+push 5个0 | setAllBits(65535)全部变1 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4370 | testBitVectorSetAllBitsValueBoundary0004 | setAllBits | new BitVector(0)+push 5个0 | setAllBits(-65535)全部变1 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4630 | testBitVectorRepeatCall0006 | setAllBits | new BitVector(0)+push 5个0 | 重复调用3次(0->1->0->1) |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4810 | testBitVector64Boundary0014 | setAllBits | new BitVector(0)+push 64 | 64边界：恰好64元素setAllBits |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4920 | testBitVector128Boundary0010 | setAllBits+values | new BitVector(0)+push 128 | 128边界：setAllBits+values()迭代 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4990 | testBitVector1024Boundary0007 | flipBitByIndex+setAllBits | new BitVector(0)+push 1025 | 1024边界：flip+setAllBits在边界 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5090 | testBitVectorConstructorNonBinaryValue0003 | setAllBits | new BitVector(128) | 非二进制值(-1,65535)在cap=128验证 |

---

## 7. BitVectorGetBitsByRange.test.ets (36用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_022 | BitVector_getBitsByRange_Func_001 | getBitsByRange | new BitVector(0)+push 5 | 范围0-3获取子向量 |
| 2 | BITVECTOR_TEST_023 | BitVector_getBitsByRange_Func_002 | getBitsByRange | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_024 | BitVector_getBitsByRange_Func_003 | getBitsByRange | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 4 | BITVECTOR_TEST_025 | BitVector_getBitsByRange_Func_004 | getBitsByRange | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_026 | BitVector_getBitsByRange_Func_005 | getBitsByRange | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 6 | BITVECTOR_TEST_027 | BitVector_getBitsByRange_Func_006 | getBitsByRange | new BitVector(0)+push 64个0 | 64元素getBitsByRange(0,64) |
| 7 | BITVECTOR_TEST_028 | BitVector_getBitsByRange_Func_007 | getBitsByRange | new BitVector(10)+push 64个0 | 74元素getBitsByRange(0,74) |
| 8 | BITVECTOR_TEST_083 | BitVector_getBitsByRange_Func_008 | getBitsByRange | new BitVector(0)+push 64个0 | 字符串类型toIndex，抛出401 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_3700 | BitVectorTest3700 | getBitsByRange | new BitVector(16)+setAllBits(1) | 正常范围(4,12)返回子向量 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_3800 | BitVectorTest3800 | getBitsByRange | new BitVector(16) | 边界索引(0,1)和(15,16) |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_3900 | BitVectorTest3900 | getBitsByRange | new BitVector(16) | fromIndex=-1，抛出10200001 |
| 12 | SUB_COLLECTIONS_BITVECTOR_TEST_4000 | BitVectorTest4000 | getBitsByRange | new BitVector(16) | 返回不同实例(instanceof)验证 |
| 13 | SUB_COLLECTIONS_BITVECTOR_TEST_4100 | BitVectorTest4100 | getBitsByRange | new BitVector(16) | toIndex=17超长度，抛出10200001 |
| 14 | SUB_COLLECTIONS_BITVECTOR_TEST_4200 | BitVectorTest4200 | getBitsByRange | new BitVector(16) | fromIndex=toIndex=8，抛出10200001 |
| 15 | SUB_COOLLECTION_BITVECTOR_01600 | BitVectortest01600 | getBitsByRange | new BitVector(0)+push 5 | NaN参数，抛出401 |
| 16 | SUB_COOLLECTION_BITVECTOR_01700 | BitVectortest01700 | getBitsByRange | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 17 | SUB_COOLLECTION_BITVECTOR_01800 | BitVectortest01800 | getBitsByRange | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1730 | testBitVectorGetBitsByRange0001 | getBitsByRange | new BitVector(0)+push 10 | fromIndex=0,toIndex=6返回子向量 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1740 | testBitVectorGetBitsByRange0002 | getBitsByRange | new BitVector(0)+push 10 | fromIndex=4,toIndex=10返回子向量 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1750 | testBitVectorGetBitsByRange0003 | getBitsByRange | new BitVector(0)+push 10 | toIndex=11超长度，抛出范围错误 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1760 | testBitVectorGetBitsByRange0004 | getBitsByRange | new BitVector(0)+push 10 | fromIndex=-1，抛出范围错误 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1770 | testBitVectorGetBitsByRange0005 | getBitsByRange | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)，抛出范围错误 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1780 | testBitVectorGetBitsByRange0006 | getBitsByRange | new BitVector(0)+push 10 | fromIndex=toIndex=5，抛出范围错误 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1790 | testBitVectorGetBitsByRange0011 | getBitsByRange | new BitVector(0)+push 3 | NaN fromIndex，抛出401 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1800 | testBitVectorGetBitsByRange0012 | getBitsByRange | new BitVector(0)+push 3 | NaN toIndex，抛出401 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1810 | testBitVectorGetBitsByRange0013 | getBitsByRange | new BitVector(0)+push 3 | 负数fromIndex，抛出10200001 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1820 | testBitVectorGetBitsByRange0014 | getBitsByRange | new BitVector(0)+push 3 | toIndex超长度，抛出10200001 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1830 | testBitVectorGetBitsByRange0016 | getBitsByRange | new BitVector(0)+push 100 | 大范围100元素getBitsByRange(50,100) |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3550 | testBitVectorGetBitsByRangeBoundary0001 | getBitsByRange | new BitVector(0)+push 5 | 全范围fromIndex=0 toIndex=length |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3560 | testBitVectorGetBitsByRangeBoundary0002 | getBitsByRange | new BitVector(0)+push 5 | 仅末尾元素fromIndex=length-1 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3570 | testBitVectorGetBitsByRangeBoundary0003 | getBitsByRange | new BitVector(0)+push 5 | 仅首元素fromIndex=0 toIndex=1 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3580 | testBitVectorGetBitsByRangeBoundary0004 | getBitsByRange | new BitVector(0)+push 1 | 单元素全范围获取 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3590 | testBitVectorGetBitsByRangeBoundary0005 | getBitsByRange | new BitVector(0)+push 100 | 大BV全范围获取 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4510 | testBitVectorEmptyBoundary0003 | getBitsByRange | new BitVector(0) | 空BV getBitsByRange(0,0)抛出10200001 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4740 | testBitVector64Boundary0007 | getBitsByRange | new BitVector(0)+push 65 | 64边界：跨64边界获取(范围60-65) |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4890 | testBitVector128Boundary0007 | getBitsByRange | new BitVector(0)+push 129 | 128边界：跨128边界获取(范围125-129) |

---

## 8. BitVectorGetBitCountByRange.test.ets (56用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_038 | BitVector_getBitCountByRange_Func_001 | getBitCountByRange | new BitVector(0)+push 5 | 统计0和1的个数 |
| 2 | BITVECTOR_TEST_039 | BitVector_getBitCountByRange_Func_002 | getBitCountByRange | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_040 | BitVector_getBitCountByRange_Func_003 | getBitCountByRange | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 4 | BITVECTOR_TEST_041 | BitVector_getBitCountByRange_Func_004 | getBitCountByRange | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_042 | BitVector_getBitCountByRange_Func_005 | getBitCountByRange | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 6 | BITVECTOR_TEST_043 | BitVector_getBitCountByRange_Func_006 | getBitCountByRange | new BitVector(0)+push 64 | 64元素跨word边界统计 |
| 7 | BITVECTOR_TEST_044 | BitVector_getBitCountByRange_Func_007 | getBitCountByRange | new BitVector(10)+push 64 | 74元素跨word边界统计 |
| 8 | BITVECTOR_TEST_084 | BitVector_getBitCountByRange_Func_008 | getBitCountByRange | new BitVector(0)+push 5 | 字符串类型toIndex，抛出401 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_4800 | BitVectorTest4800 | getBitCountByRange | new BitVector(16)+[5,10,15]=1 | 统计1的个数=3 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_4900 | BitVectorTest4900 | getBitCountByRange | new BitVector(16)+[5,10]=1 | 统计0、1和非零值2的个数 |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_5000 | BitVectorTest5000 | getBitCountByRange | new BitVector(16)+[5,10]=1 | 不同子范围统计 |
| 12 | SUB_COLLECTIONS_BITVECTOR_TEST_5100 | BitVectorTest5100 | getBitCountByRange | new BitVector(16)+setAllBits(1) | 全范围统计，返回number类型 |
| 13 | SUB_COOLLECTION_BITVECTOR_02400 | BitVectortest02400 | getBitCountByRange | new BitVector(0)+push 5 | NaN toIndex，抛出401 |
| 14 | SUB_COOLLECTION_BITVECTOR_02500 | BitVectortest02500 | getBitCountByRange | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 15 | SUB_COOLLECTION_BITVECTOR_02600 | BitVectortest02600 | getBitCountByRange | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1940 | testBitVectorGetBitCountByRange0001 | getBitCountByRange | new BitVector(0)+push 10 | 范围0-6统计1的个数=1 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1950 | testBitVectorGetBitCountByRange0002 | getBitCountByRange | new BitVector(0)+push 10 | 范围4-10统计1的个数=5 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1960 | testBitVectorGetBitCountByRange0003 | getBitCountByRange | new BitVector(0)+push 10 | toIndex=11超长度，抛出范围错误 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1970 | testBitVectorGetBitCountByRange0004 | getBitCountByRange | new BitVector(0)+push 10 | fromIndex=-1，抛出范围错误 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1980 | testBitVectorGetBitCountByRange0005 | getBitCountByRange | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)，抛出范围错误 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1990 | testBitVectorGetBitCountByRange0006 | getBitCountByRange | new BitVector(0)+push 10 | fromIndex=toIndex=5，抛出范围错误 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2000 | testBitVectorGetBitCountByRange0007 | getBitCountByRange | new BitVector(0)+push 10 | 非零值2统计，等于1的个数 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2010 | testBitVectorGetBitCountByRange0008 | getBitCountByRange | new BitVector(0)+push 10 | 负数-1统计，等于1的个数 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2020 | testBitVectorGetBitCountByRange0010 | getBitCountByRange | new BitVector(0)+push 10 | fromIndex=NaN，抛出401 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2030 | testBitVectorGetBitCountByRange0011 | getBitCountByRange | new BitVector(0)+push 10 | toIndex=NaN，抛出401 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2040 | testBitVectorGetBitCountByRange0012 | getBitCountByRange | new BitVector(5)+push 5个0 | 全0统计1的个数=0 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2050 | testBitVectorGetBitCountByRange0013 | getBitCountByRange | new BitVector(0)+push 5个1 | 全1统计1的个数=5 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2060 | testBitVectorGetBitCountByRange0014 | getBitCountByRange | new BitVector(0)+push 100 | 大BV统计1的个数=50 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2070 | testBitVectorGetBitCountByRange0015 | getBitCountByRange | new BitVector(0)+push 1 | 单元素BV统计 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2080 | testBitVectorGetBitCountByRange0017 | getBitCountByRange | new BitVector(0)+push 10 | 返回类型number验证 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2090 | testBitVectorGetBitCountByRange0018 | getBitCountByRange | new BitVector(0)+push 10 | fromIndex=Infinity，抛出401 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2100 | testBitVectorGetBitCountByRange0019 | getBitCountByRange | new BitVector(0)+push 10 | toIndex=Infinity，抛出401 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2110 | testBitVectorGetBitCountByRange0020 | getBitCountByRange | new BitVector(0)+push 10(0,1交替) | 交替位统计1的个数=5 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2120 | testBitVectorGetBitCountByRange0027 | getBitCountByRange | new BitVector(5)+push 5 | fromIndex=length-1统计 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2130 | testBitVectorGetBitCountByRange0028 | getBitCountByRange | new BitVector(0)+push 5 | toIndex=fromIndex+1统计 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2140 | testBitVectorGetBitCountByRange0029 | getBitCountByRange | new BitVector(0)+push 5 | toIndex=fromIndex+2统计 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2150 | testBitVectorGetBitCountByRange0030 | getBitCountByRange | new BitVector(0)+push 5 | 单元素匹配返回1 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3600 | testBitVectorGetBitCountByRangeBoundary0001 | getBitCountByRange | new BitVector(0)+push 5 | 全范围toIndex=length统计1 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3610 | testBitVectorGetBitCountByRangeBoundary0002 | getBitCountByRange | new BitVector(0)+push 5 | 末尾元素fromIndex=length-1统计 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3620 | testBitVectorGetBitCountByRangeBoundary0003 | getBitCountByRange | new BitVector(0)+push 5 | 首元素fromIndex=0 toIndex=1统计 |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3630 | testBitVectorGetBitCountByRangeBoundary0004 | getBitCountByRange | new BitVector(0)+push 10个0 | 全0统计1=0 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3640 | testBitVectorGetBitCountByRangeBoundary0005 | getBitCountByRange | new BitVector(0)+push 10个1 | 全1统计0=0 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4150 | testBitVectorGetBitCountByRangePatternBoundary0001 | getBitCountByRange | new BitVector(0)+push 10个0 | 全0模式：count(0)=10,count(1)=0 |
| 44 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4160 | testBitVectorGetBitCountByRangePatternBoundary0002 | getBitCountByRange | new BitVector(0)+push 10个1 | 全1模式：count(1)=10,count(0)=0 |
| 45 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4170 | testBitVectorGetBitCountByRangePatternBoundary0003 | getBitCountByRange | new BitVector(0)+push 10个-1 | 全-1模式：count(1)=10,count(0)=0 |
| 46 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4180 | testBitVectorGetBitCountByRangePatternBoundary0004 | getBitCountByRange | new BitVector(0)+push 10个2 | 全2模式：count(1)=10,count(0)=0 |
| 47 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4190 | testBitVectorGetBitCountByRangePatternBoundary0005 | getBitCountByRange | new BitVector(0)+push 10(0,1交替) | 交替模式：count(1)=5 |
| 48 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4200 | testBitVectorGetBitCountByRangePatternBoundary0006 | getBitCountByRange | new BitVector(0)+push 9个0+1个1 | 全0中单个1：count(1)=1,count(0)=9 |
| 49 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4210 | testBitVectorGetBitCountByRangePatternBoundary0007 | getBitCountByRange | new BitVector(0)+push 9个1+1个0 | 全1中单个0：count(0)=1,count(1)=9 |
| 50 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4520 | testBitVectorEmptyBoundary0004 | getBitCountByRange | new BitVector(0) | 空BV统计，抛出10200001 |
| 51 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4420 | testBitVectorContainerSizeBoundary0002 | getBitCountByRange+has | new BitVector(0)+push 1 | size=1容器全范围操作 |
| 52 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4430 | testBitVectorContainerSizeBoundary0003 | getBitCountByRange+has | new BitVector(0)+push 2 | size=2容器全范围操作 |
| 53 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4440 | testBitVectorContainerSizeBoundary0004 | getBitCountByRange+has | new BitVector(0)+push 100个0 | size=100容器全范围操作 |
| 54 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4750 | testBitVector64Boundary0008 | getBitCountByRange | new BitVector(0)+push 65 | 64边界：跨64边界统计(范围60-65) |
| 55 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4900 | testBitVector128Boundary0008 | getBitCountByRange | new BitVector(0)+push 129 | 128边界：跨128边界统计(范围125-129) |
| 56 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4980 | testBitVector1024Boundary0006 | getBitCountByRange+getBitsByRange | new BitVector(0)+push 1025 | 1024边界：跨边界统计+获取(范围1020-1025) |

---

## 9. BitVectorResize.test.ets (25活跃+5注释=30总计)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1840 | testBitVectorResize0001 | resize | new BitVector(0)+push 3 | size=-1，抛出范围错误 |
| 2 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1850 | testBitVectorResize0002 | resize | new BitVector(0)+push 3 | size=5扩容，新位为0 |
| 3 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1860 | testBitVectorResize0003 | resize | new BitVector(0)+push 3 | size=1缩容 |
| 4 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1870 | testBitVectorResize0005 | resize | new BitVector(5) | 额外参数测试，size=10扩容 |
| 5 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1880 | testBitVectorResize0008 | resize | new BitVector(5) | NaN参数，抛出401 |
| 6 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1890 | testBitVectorResize0009 | resize | new BitVector(5) | Infinity参数，抛出401 |
| 7 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1900 | testBitVectorResize0013 | resize | new BitVector(0)+push 3 | resize(0)清空 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1910 | testBitVectorResize0014 | resize | new BitVector(0)+push 2 | 大尺寸100000扩容 |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1920 | testBitVectorResize0015 | resize | new BitVector(0)+push 3 | resize到相同size |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_1930 | testBitVectorResize0016 | resize | new BitVector(0)+push 5 | 扩容后原数据保留验证 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3810 | testBitVectorResizeBoundary0001 | resize | new BitVector(0)+push 3 | 从非零length缩至0 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3820 | testBitVectorResizeBoundary0002 | resize | new BitVector(0)+push 3 | resize到相同size，数据不变 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3830 | testBitVectorResizeBoundary0003 | resize | new BitVector(0)+push 3 | resize到length+1，新元素为0 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3840 | testBitVectorResizeBoundary0004 | resize | new BitVector(0)+push 3 | resize到length-1，截断 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4620 | testBitVectorRepeatCall0005 | resize | new BitVector(0)+push 1 | 重复调用：扩容->缩容->扩容 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4640 | testBitVectorEmptyResizeBoundary0001 | resize | new BitVector(0) | 空BV resize(0)，length保持0 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4650 | testBitVectorEmptyResizeBoundary0002 | resize | new BitVector(0) | 空BV resize(1)，已知问题 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4660 | testBitVectorEmptyResizeBoundary0003 | resize | new BitVector(0) | 空BV resize(64)，已知问题 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4670 | testBitVectorEmptyResizeBoundary0004 | resize | new BitVector(0)+push 1+pop | 变空后resize(1) |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4700 | testBitVector64Boundary0003 | resize | new BitVector(0)+push 64 | 64边界：64->65扩容跨word边界 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4710 | testBitVector64Boundary0004 | resize | new BitVector(0)+push 65 | 64边界：65->64缩容跨word边界 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4850 | testBitVector128Boundary0003 | resize | new BitVector(0)+push 128 | 128边界：128->129扩容跨边界 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4860 | testBitVector128Boundary0004 | resize | new BitVector(0)+push 129 | 128边界：129->128缩容跨边界 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4950 | testBitVector1024Boundary0003 | resize | new BitVector(0)+push 1024 | 1024边界：1024->1025扩容跨边界 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4960 | testBitVector1024Boundary0004 | resize | new BitVector(0)+push 1025 | 1024边界：1025->1024缩容跨边界 |
| 26(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3850 | testBitVectorResizeBoundary0005 | resize | new BitVector(0) | 空BV resize(0->1)，已知问题可能崩溃 |
| 27(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4450 | testBitVectorContainerSizeBoundary0005 | has+getBitCountByRange | new BitVector(0)+push 10000个1 | size=10000大容器全范围操作 |
| 28(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4460 | testBitVectorComprehensiveBoundary0001 | push+has+getBitCountByRange+getIndexOf | new BitVector(0)+push混合值 | 综合测试：混合值push后多接口验证 |
| 29(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4470 | testBitVectorComprehensiveBoundary0002 | setBitsByRange+flipBitsByRange+has | new BitVector(0)+push 10个0 | 综合测试：setBitsByRange后flip再has验证 |
| 30(注释) | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4480 | testBitVectorComprehensiveBoundary0003 | resize+has | new BitVector(0)+push 5个1 | 综合测试：resize后has新边界验证 |

---

## 10. BitVectorGetIndexOf.test.ets (43用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_045 | BitVector_getIndexOf_Func_001 | getIndexOf | new BitVector(0)+push 5 | 查找0和1第一次出现位置 |
| 2 | BITVECTOR_TEST_046 | BitVector_getIndexOf_Func_002 | getIndexOf | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_047 | BitVector_getIndexOf_Func_003 | getIndexOf | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 4 | BITVECTOR_TEST_048 | BitVector_getIndexOf_Func_004 | getIndexOf | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_049 | BitVector_getIndexOf_Func_005 | getIndexOf | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 6 | BITVECTOR_TEST_050 | BitVector_getIndexOf_Func_006 | getIndexOf | new BitVector(0)+push 64 | 64元素跨word边界查找 |
| 7 | BITVECTOR_TEST_051 | BitVector_getIndexOf_Func_007 | getIndexOf | new BitVector(10)+push 64 | 74元素跨word边界查找 |
| 8 | SUB_COLLECTIONS_BITVECTOR_TEST_5200 | BitVectorTest5200 | getIndexOf | new BitVector(16)+[5,10]=1 | 返回第一次出现索引，非零值2同1 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_5300 | BitVectorTest5300 | getIndexOf | new BitVector(16)+[5,10]=1 | 指定范围查找和未找到返回-1 |
| 10 | SUB_COOLLECTION_BITVECTOR_02800 | BitVectortest02800 | getIndexOf | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 11 | SUB_COOLLECTION_BITVECTOR_02900 | BitVectortest02900 | getIndexOf | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2160 | testBitVectorGetIndexOf0026 | getIndexOf | new BitVector(5)+push 5个0 | 多个匹配返回第一个 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2170 | testBitVectorGetIndexOf0027 | getIndexOf | new BitVector(0)+push 5 | 末尾元素匹配 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2180 | testBitVectorGetIndexOf0028 | getIndexOf | new BitVector(5)+push 5 | fromIndex=length-1查找 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2190 | testBitVectorGetIndexOf0001 | getIndexOf | new BitVector(0)+push 10 | element=0范围0-10返回0 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2200 | testBitVectorGetIndexOf0002 | getIndexOf | new BitVector(0)+push 10 | element=0范围0-5返回0 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2210 | testBitVectorGetIndexOf0003 | getIndexOf | new BitVector(0)+push 10 | element=1范围0-5返回-1 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2220 | testBitVectorGetIndexOf0004 | getIndexOf | new BitVector(0)+push 10 | element=1范围0-10返回5 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2230 | testBitVectorGetIndexOf0005 | getIndexOf | new BitVector(0)+push 10 | fromIndex=-1抛出范围错误 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2240 | testBitVectorGetIndexOf0006 | getIndexOf | new BitVector(0)+push 10 | toIndex=11超长度抛出范围错误 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2250 | testBitVectorGetIndexOf0007 | getIndexOf | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)抛出范围错误 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2260 | testBitVectorGetIndexOf0008 | getIndexOf | new BitVector(0)+push 10 | fromIndex=toIndex=5抛出范围错误 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2270 | testBitVectorGetIndexOf0009 | getIndexOf | new BitVector(0)+push 10 | 非零值2查找返回第一个1位置 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2280 | testBitVectorGetIndexOf0010 | getIndexOf | new BitVector(0)+push 10 | 负数-1查找返回第一个1位置 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2290 | testBitVectorGetIndexOf0012 | getIndexOf | new BitVector(0)+push 10 | fromIndex=NaN抛出401 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2300 | testBitVectorGetIndexOf0013 | getIndexOf | new BitVector(0)+push 10 | toIndex=NaN抛出401 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2310 | testBitVectorGetIndexOf0014 | getIndexOf | new BitVector(3)+push 3个0 | 全0查找1返回-1 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2320 | testBitVectorGetIndexOf0015 | getIndexOf | new BitVector(0)+push 3个1 | 全1查找0返回-1 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2330 | testBitVectorGetIndexOf0016 | getIndexOf | new BitVector(100)+push 100个0+setBitsByRange | 大BV查找 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2340 | testBitVectorGetIndexOf0017 | getIndexOf | new BitVector(1)+push 1 | 单元素BV查找 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2350 | testBitVectorGetIndexOf0019 | getIndexOf | new BitVector(0)+push 10 | 返回类型number验证 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2360 | testBitVectorGetIndexOf0020 | getIndexOf | new BitVector(5)+push 5 | 首元素匹配 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3650 | testBitVectorGetIndexOfBoundary0001 | getIndexOf | new BitVector(0)+push 5个0 | 全范围未找到返回-1 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3660 | testBitVectorGetIndexOfBoundary0002 | getIndexOf | new BitVector(0)+push 5 | 末尾元素fromIndex=length-1 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3670 | testBitVectorGetIndexOfBoundary0003 | getIndexOf | new BitVector(0)+push 5 | 首元素fromIndex=0 toIndex=1 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3680 | testBitVectorGetIndexOfBoundary0004 | getIndexOf | new BitVector(0)+push 5个1 | 全1查找0返回-1 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4220 | testBitVectorGetIndexOfPatternBoundary0001 | getIndexOf | new BitVector(0)+push 10个0 | 全0模式：getIndexOf(0)=0,getIndexOf(1)=-1 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4230 | testBitVectorGetIndexOfPatternBoundary0002 | getIndexOf | new BitVector(0)+push 10个1 | 全1模式：getIndexOf(1)=0,getIndexOf(0)=-1 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4240 | testBitVectorGetIndexOfPatternBoundary0003 | getIndexOf | new BitVector(0)+push 10个-1 | 全-1模式：getIndexOf(1)=0,getIndexOf(0)=-1 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4250 | testBitVectorGetIndexOfPatternBoundary0004 | getIndexOf | new BitVector(0)+push 10个2 | 全2模式：getIndexOf(1)=0,getIndexOf(0)=-1 |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4260 | testBitVectorGetIndexOfPatternBoundary0005 | getIndexOf | new BitVector(0)+push 10(0,1交替) | 交替模式：getIndexOf(0)=0,getIndexOf(1)=1 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4270 | testBitVectorGetIndexOfPatternBoundary0006 | getIndexOf | new BitVector(0)+push 9个0+1个1 | 全0中单个1：getIndexOf(1)=9 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4530 | testBitVectorEmptyBoundary0005 | getIndexOf | new BitVector(0) | 空BV getIndexOf抛出10200001 |

---

## 11. BitVectorGetLastIndexOf.test.ets (42用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_052 | BitVector_getLastIndexOf_Func_001 | getLastIndexOf | new BitVector(0)+push 5 | 查找0和1最后出现位置 |
| 2 | BITVECTOR_TEST_053 | BitVector_getLastIndexOf_Func_002 | getLastIndexOf | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_054 | BitVector_getLastIndexOf_Func_003 | getLastIndexOf | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 4 | BITVECTOR_TEST_055 | BitVector_getLastIndexOf_Func_004 | getLastIndexOf | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_056 | BitVector_getLastIndexOf_Func_005 | getLastIndexOf | new BitVector(0)+push 8 | 浮点索引(0.1,6.1)，抛出401 |
| 6 | BITVECTOR_TEST_057 | BitVector_getLastIndexOf_Func_006 | getLastIndexOf | new BitVector(0)+push 64 | 64元素跨word边界查找 |
| 7 | BITVECTOR_TEST_058 | BitVector_getLastIndexOf_Func_007 | getLastIndexOf | new BitVector(10)+push 64 | 74元素跨word边界查找 |
| 8 | SUB_COLLECTIONS_BITVECTOR_TEST_5400 | BitVectorTest5400 | getLastIndexOf | new BitVector(16)+[5,10]=1 | 返回最后出现位置和-1 |
| 9 | SUB_COOLLECTION_BITVECTOR_03100 | BitVectortest03100 | getLastIndexOf | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 10 | SUB_COOLLECTION_BITVECTOR_03200 | BitVectortest03200 | getLastIndexOf | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2370 | testBitVectorGetLastIndexOf0001 | getLastIndexOf | new BitVector(0)+push 10 | element=0范围0-10返回4 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2380 | testBitVectorGetLastIndexOf0002 | getLastIndexOf | new BitVector(0)+push 10 | element=0范围0-5返回4 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2390 | testBitVectorGetLastIndexOf0003 | getLastIndexOf | new BitVector(0)+push 10 | element=1范围0-5返回-1 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2400 | testBitVectorGetLastIndexOf0004 | getLastIndexOf | new BitVector(0)+push 10 | element=1范围0-10返回9 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2410 | testBitVectorGetLastIndexOf0005 | getLastIndexOf | new BitVector(0)+push 10 | fromIndex=-1抛出范围错误 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2420 | testBitVectorGetLastIndexOf0006 | getLastIndexOf | new BitVector(0)+push 10 | toIndex=11超长度抛出范围错误 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2430 | testBitVectorGetLastIndexOf0007 | getLastIndexOf | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)抛出范围错误 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2440 | testBitVectorGetLastIndexOf0008 | getLastIndexOf | new BitVector(0)+push 10 | fromIndex=toIndex=5抛出范围错误 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2450 | testBitVectorGetLastIndexOf0009 | getLastIndexOf | new BitVector(0)+push 5(0,1交替) | 非零值2查找返回最后1位置 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2460 | testBitVectorGetLastIndexOf0010 | getLastIndexOf | new BitVector(0)+push 5(0,1交替) | 负数-1查找返回最后1位置 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2470 | testBitVectorGetLastIndexOf0012 | getLastIndexOf | new BitVector(5)+push 5 | fromIndex=NaN抛出401 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2480 | testBitVectorGetLastIndexOf0013 | getLastIndexOf | new BitVector(5)+push 5 | fromIndex=Infinity抛出401 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2490 | testBitVectorGetLastIndexOf0014 | getLastIndexOf | new BitVector(5)+push 5 | toIndex=NaN抛出401 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2500 | testBitVectorGetLastIndexOf0015 | getLastIndexOf | new BitVector(5)+push 5个0 | 全0查找1返回-1 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2510 | testBitVectorGetLastIndexOf0016 | getLastIndexOf | new BitVector(0)+push 5个1 | 全1查找0返回-1 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2520 | testBitVectorGetLastIndexOf0017 | getLastIndexOf | new BitVector(0)+push 100 | 大BV查找0最后位置=98 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2530 | testBitVectorGetLastIndexOf0018 | getLastIndexOf | new BitVector(1)+push 1 | 单元素BV查找 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2550 | testBitVectorGetLastIndexOf0020 | getLastIndexOf | new BitVector(5)+push 5 | 返回类型number验证 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2560 | testBitVectorGetLastIndexOf0024 | getLastIndexOf | new BitVector(5)+push 5 | fromIndex=length-1查找 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2570 | testBitVectorGetLastIndexOf0025 | getLastIndexOf | new BitVector(5)+push 5 | toIndex=fromIndex+1查找 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2580 | testBitVectorGetLastIndexOf0026 | getLastIndexOf | new BitVector(6)+push 6 | 多个匹配返回最后 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3690 | testBitVectorGetLastIndexOfBoundary0001 | getLastIndexOf | new BitVector(0)+push 5个0 | 全范围未找到返回-1 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3700 | testBitVectorGetLastIndexOfBoundary0002 | getLastIndexOf | new BitVector(0)+push 5 | 末尾元素fromIndex=length-1 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3710 | testBitVectorGetLastIndexOfBoundary0003 | getLastIndexOf | new BitVector(0)+push 5 | 首元素fromIndex=0 toIndex=1 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3720 | testBitVectorGetLastIndexOfBoundary0004 | getLastIndexOf | new BitVector(0)+push 5个1 | 全1查找0返回-1 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4280 | testBitVectorGetLastIndexOfPatternBoundary0001 | getLastIndexOf | new BitVector(0)+push 10个0 | 全0模式：getLastIndexOf(0)=9,getLastIndexOf(1)=-1 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4290 | testBitVectorGetLastIndexOfPatternBoundary0002 | getLastIndexOf | new BitVector(0)+push 10个1 | 全1模式：getLastIndexOf(1)=9,getLastIndexOf(0)=-1 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4300 | testBitVectorGetLastIndexOfPatternBoundary0003 | getLastIndexOf | new BitVector(0)+push 10个-1 | 全-1模式：getLastIndexOf(1)=9 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4310 | testBitVectorGetLastIndexOfPatternBoundary0004 | getLastIndexOf | new BitVector(0)+push 10个2 | 全2模式：getLastIndexOf(1)=9 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4320 | testBitVectorGetLastIndexOfPatternBoundary0005 | getLastIndexOf | new BitVector(0)+push 10(0,1交替) | 交替模式：getLastIndexOf(1)=9,getLastIndexOf(0)=8 |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4330 | testBitVectorGetLastIndexOfPatternBoundary0006 | getLastIndexOf | new BitVector(0)+push 9个1+1个0 | 全1中单个0：getLastIndexOf(0)=9 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4540 | testBitVectorEmptyBoundary0006 | getLastIndexOf | new BitVector(0) | 空BV getLastIndexOf抛出10200001 |

---

## 12. BitVectorFlipBitByIndex.test.ets (34用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_059 | BitVector_flipBitByIndex_Func_001 | flipBitByIndex | new BitVector(0)+push 5 | 翻转5个位(1->0,0->1) |
| 2 | BITVECTOR_TEST_060 | BitVector_flipBitByIndex_Func_002 | flipBitByIndex | new BitVector(0)+push 8 | index=20超范围，抛出10200001 |
| 3 | BITVECTOR_TEST_061 | BitVector_flipBitByIndex_Func_003 | flipBitByIndex | new BitVector(0)+push 8 | 浮点index=6.1，抛出401 |
| 4 | BITVECTOR_TEST_062 | BitVector_flipBitByIndex_Func_004 | flipBitByIndex | new BitVector(0)+push 64 | 64元素全部翻转 |
| 5 | BITVECTOR_TEST_063 | BitVector_flipBitByIndex_Func_005 | flipBitByIndex | new BitVector(10)+push 64 | 74元素翻转(索引10-73) |
| 6 | BITVECTOR_TEST_087 | BitVector_flipBitByIndex_Func_006 | flipBitByIndex | new BitVector(0)+push 7 | index=-2负数，抛出10200001 |
| 7 | BITVECTOR_TEST_088 | BitVector_flipBitByIndex_Func_007 | flipBitByIndex | new BitVector(0)+push 7 | 字符串类型index，抛出401 |
| 8 | SUB_COLLECTIONS_BITVECTOR_TEST_5500 | BitVectorTest5500 | flipBitByIndex | new BitVector(16)+[5]=0 | 翻转0->1和1->0 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_5600 | BitVectorTest5600 | flipBitByIndex | new BitVector(16) | 边界索引0和length-1翻转 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_5700 | BitVectorTest5700 | flipBitByIndex | new BitVector(16) | 负数index=-1，抛出10200001 |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_5800 | BitVectorTest5800 | flipBitByIndex | new BitVector(16) | index=16超范围，抛出10200001 |
| 12 | SUB_COLLECTIONS_BITVECTOR_TEST_5900 | BitVectorTest5900 | flipBitByIndex | new BitVector(16) | 浮点index=5.5，抛出401 |
| 13 | SUB_COLLECTIONS_BITVECTOR_TEST_6000 | BitVectorTest6000 | flipBitByIndex | new BitVector(16) | 返回void(undefined)验证 |
| 14 | SUB_COOLLECTION_BITVECTOR_03400 | BitVectortest03400 | flipBitByIndex | new BitVector(0)+push 5 | NaN index，抛出401 |
| 15 | SUB_COOLLECTION_BITVECTOR_03500 | BitVectortest03500 | flipBitByIndex | new BitVector(0)+push 5 | index=-1，抛出10200001 |
| 16 | SUB_COOLLECTION_BITVECTOR_03600 | BitVectortest03600 | flipBitByIndex | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 17 | SUB_COOLLECTION_BITVECTOR_05200 | BitVectortest05200 | flipBitByIndex+taskpool | new BitVector(4) | 并发翻转跨线程调用，10200201 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2590 | testBitVectorFlipBitByIndex0001 | flipBitByIndex | new BitVector(0)+push 3 | index=0翻转 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2600 | testBitVectorFlipBitByIndex0002 | flipBitByIndex | new BitVector(0)+push 3 | index=5超范围，抛出范围错误 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2610 | testBitVectorFlipBitByIndex0003 | flipBitByIndex | new BitVector(0)+push 3 | index=-1负数，抛出范围错误 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2620 | testBitVectorFlipBitByIndex0005 | flipBitByIndex | new BitVector(5)+push 3 | 额外参数测试 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2630 | testBitVectorFlipBitByIndex0008 | flipBitByIndex | new BitVector(5)+push 3 | NaN参数，抛出401 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2640 | testBitVectorFlipBitByIndex0009 | flipBitByIndex | new BitVector(5)+push 3 | Infinity参数，抛出401 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2650 | testBitVectorFlipBitByIndex0010 | flipBitByIndex | new BitVector(5)+push 3 | 负数index，抛出10200001 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2660 | testBitVectorFlipBitByIndex0012 | flipBitByIndex | new BitVector(5)+push 5 | 翻转0->1，返回void验证 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2670 | testBitVectorFlipBitByIndex0013 | flipBitByIndex | new BitVector(0)+push 5 | 翻转1->0并二次翻转恢复原值 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3730 | testBitVectorFlipBitByIndexBoundary0001 | flipBitByIndex | new BitVector(0)+push 3 | 首元素index=0翻转 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3740 | testBitVectorFlipBitByIndexBoundary0002 | flipBitByIndex | new BitVector(0)+push 3 | 末尾元素index=length-1翻转 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3750 | testBitVectorFlipBitByIndexBoundary0003 | flipBitByIndex | new BitVector(0)+push 3 | index=length超范围，抛出10200001 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3760 | testBitVectorFlipBitByIndexBoundary0004 | flipBitByIndex | new BitVector(0)+push 1 | 单元素index=0二次翻转恢复 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4550 | testBitVectorEmptyBoundary0007 | flipBitByIndex | new BitVector(0) | 空BV翻转，抛出10200001 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4780 | testBitVector64Boundary0012 | flipBitByIndex | new BitVector(0)+push 65 | 64边界：边界索引63和64翻转 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4900 | testBitVector128Boundary0009 | flipBitByIndex | new BitVector(0)+push 129 | 128边界：边界索引127、128及129超范围 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_5100 | testBitVectorConstructorNonBinaryValue0004 | flipBitByIndex | new BitVector(1024) | 1024边界：边界索引63,64,127,128,1023翻转 |

---

## 13. BitVectorFlipBitsByRange.test.ets (45用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_064 | BitVector_flipBitsByRange_Func_001 | flipBitsByRange | new BitVector(0)+push 5 | 范围0-4翻转 |
| 2 | BITVECTOR_TEST_065 | BitVector_flipBitsByRange_Func_002 | flipBitsByRange | new BitVector(0)+push 8 | toIndex=-3，抛出10200001 |
| 3 | BITVECTOR_TEST_066 | BitVector_flipBitsByRange_Func_003 | flipBitsByRange | new BitVector(0)+push 8 | fromIndex=toIndex=-3，抛出10200001 |
| 4 | BITVECTOR_TEST_067 | BitVector_flipBitsByRange_Func_004 | flipBitsByRange | new BitVector(0)+push 8 | fromIndex=-3，抛出10200001 |
| 5 | BITVECTOR_TEST_068 | BitVector_flipBitsByRange_Func_005 | flipBitsByRange | new BitVector(0)+push 8 | 浮点fromIndex=3.11，抛出401 |
| 6 | BITVECTOR_TEST_069 | BitVector_flipBitsByRange_Func_006 | flipBitsByRange | new BitVector(0)+push 64 | 64元素范围0-32翻转 |
| 7 | BITVECTOR_TEST_070 | BitVector_flipBitsByRange_Func_007 | flipBitsByRange | new BitVector(10)+push 64 | 74元素范围10-74翻转 |
| 8 | BITVECTOR_TEST_089 | BitVector_flipBitsByRange_Func_008 | flipBitsByRange | new BitVector(0)+push 64个1 | 字符串类型toIndex，抛出401 |
| 9 | SUB_COLLECTIONS_BITVECTOR_TEST_6100 | BitVectorTest6100 | flipBitsByRange | new BitVector(16)+setAllBits(0) | 范围0-8翻转 |
| 10 | SUB_COLLECTIONS_BITVECTOR_TEST_6200 | BitVectorTest6200 | flipBitsByRange | new BitVector(16) | fromIndex=-1，抛出10200001 |
| 11 | SUB_COLLECTIONS_BITVECTOR_TEST_6300 | BitVectorTest6300 | flipBitsByRange | new BitVector(16) | 返回void(undefined)验证 |
| 12 | SUB_COOLLECTION_BITVECTOR_03800 | BitVectortest03800 | flipBitsByRange | new BitVector(0)+push 5 | NaN fromIndex，抛出401 |
| 13 | SUB_COOLLECTION_BITVECTOR_03900 | BitVectortest03900 | flipBitsByRange | new BitVector(0)+push 5 | fromIndex=-1，抛出10200001 |
| 14 | SUB_COOLLECTION_BITVECTOR_04000 | BitVectortest04000 | flipBitsByRange | new BitVector(0)+push 5 | 解绑方法调用，抛出10200011 |
| 15 | SUB_COOLLECTION_BITVECTOR_05300 | BitVectortest05300 | flipBitsByRange+taskpool | new BitVector(4) | 并发翻转跨线程调用，10200201 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2680 | testBitVectorFlipBitsByRange0001 | flipBitsByRange | new BitVector(0)+push 10 | 范围0-6翻转 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2690 | testBitVectorFlipBitsByRange0002 | flipBitsByRange | new BitVector(0)+push 10 | 范围4-10翻转 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2700 | testBitVectorFlipBitsByRange0003 | flipBitsByRange | new BitVector(0)+push 10 | toIndex=11超长度，抛出范围错误 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2710 | testBitVectorFlipBitsByRange0004 | flipBitsByRange | new BitVector(0)+push 10 | fromIndex=-1，抛出范围错误 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2720 | testBitVectorFlipBitsByRange0005 | flipBitsByRange | new BitVector(0)+push 10 | fromIndex>toIndex(5>4)，抛出范围错误 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2730 | testBitVectorFlipBitsByRange0006 | flipBitsByRange | new BitVector(0)+push 10 | fromIndex=toIndex=5，抛出范围错误 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2740 | testBitVectorFlipBitsByRange0011 | flipBitsByRange | new BitVector(5)+push 2 | NaN fromIndex，抛出401 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2750 | testBitVectorFlipBitsByRange0012 | flipBitsByRange | new BitVector(0)+push 5 | 全范围翻转 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2760 | testBitVectorFlipBitsByRange0013 | flipBitsByRange | new BitVector(0)+push 5 | 单元素范围翻转 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2770 | testBitVectorFlipBitsByRange0014 | flipBitsByRange | new BitVector(5)+push 5 | 范围外元素不变 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2780 | testBitVectorFlipBitsByRange0015 | flipBitsByRange | new BitVector(5)+push 5 | 二次翻转恢复原值 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2790 | testBitVectorFlipBitsByRange0016 | flipBitsByRange | new BitVector(1)+push 1 | 单元素BV翻转 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2800 | testBitVectorFlipBitsByRange0017 | flipBitsByRange | new BitVector(0)+push 100 | 大BV翻转 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2810 | testBitVectorFlipBitsByRange0019 | flipBitsByRange | new BitVector(5)+push 5 | 返回undefined验证 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2820 | testBitVectorFlipBitsByRange0020 | flipBitsByRange | new BitVector(5)+push 5 | 翻转后length不变 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2830 | testBitVectorFlipBitsByRange0021 | flipBitsByRange | new BitVector(5)+push 5 | fromIndex=Infinity，抛出401 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2840 | testBitVectorFlipBitsByRange0022 | flipBitsByRange | new BitVector(5)+push 5 | toIndex=NaN，抛出401 |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2850 | testBitVectorFlipBitsByRange0023 | flipBitsByRange | new BitVector(50)+push 50个0 | 十六进制索引(0x1A,0x1E)翻转 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2860 | testBitVectorFlipBitsByRange0024 | flipBitsByRange | new BitVector(20)+push 20个0 | 八进制索引(0o12,0o15)翻转 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2870 | testBitVectorFlipBitsByRange0025 | flipBitsByRange | new BitVector(0)+push 5 | fromIndex包含验证 |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2880 | testBitVectorFlipBitsByRange0026 | flipBitsByRange | new BitVector(5)+push 5 | toIndex排除验证 |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2890 | testBitVectorFlipBitsByRange0027 | flipBitsByRange | new BitVector(0)+push 5 | 多个不同范围连续翻转 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3770 | testBitVectorFlipBitsByRangeBoundary0001 | flipBitsByRange | new BitVector(0)+push 5 | 全范围fromIndex=0 toIndex=length |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3780 | testBitVectorFlipBitsByRangeBoundary0002 | flipBitsByRange | new BitVector(0)+push 5 | 仅末尾元素fromIndex=length-1 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3790 | testBitVectorFlipBitsByRangeBoundary0003 | flipBitsByRange | new BitVector(0)+push 5 | 仅首元素fromIndex=0 toIndex=1 |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3800 | testBitVectorFlipBitsByRangeBoundary0004 | flipBitsByRange | new BitVector(0)+push 1 | 单元素全范围翻转 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4560 | testBitVectorEmptyBoundary0008 | flipBitsByRange | new BitVector(0) | 空BV翻转，抛出10200001 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4610 | testBitVectorRepeatCall0004 | flipBitsByRange | new BitVector(0)+push 5 | 重复调用两次同范围恢复原值 |
| 44 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4730 | testBitVector64Boundary0006 | flipBitsByRange | new BitVector(0)+push 65个0 | 64边界：跨64边界翻转(范围60-65) |
| 45 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4880 | testBitVector128Boundary0006 | flipBitsByRange | new BitVector(0)+push 129个0 | 128边界：跨128边界翻转(范围125-129) |

---

## 14. BitVectorValues.test.ets (45用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_071 | BitVector_Values_Func_001 | values | new BitVector(0)+push 5 | 迭代器遍历验证值 |
| 2 | BITVECTOR_TEST_072 | BitVector_Values_Func_002 | values | new BitVector(0)+push 64个0 | 64元素迭代器遍历 |
| 3 | BITVECTOR_TEST_073 | BitVector_Values_Func_003 | values | new BitVector(10)+push 64个0 | 74元素迭代器遍历 |
| 4 | SUB_COLLECTIONS_BITVECTOR_TEST_6400 | BitVectorTest6400 | values | new BitVector(8)+[0]=1 | 迭代器第一个元素验证 |
| 5 | SUB_COLLECTIONS_BITVECTOR_TEST_6500 | BitVectorTest6500 | values | new BitVector(8) | 迭代器遍历覆盖所有元素 |
| 6 | BitVectortest04200 | BitVectortest04200 | values | new BitVector(0) | 解绑values方法调用，抛出10200011 |
| 7 | SUB_COOLLECTION_BITVECTOR_05400 | BitVectortest05400 | values+taskpool | new BitVector(4) | 并发values跨线程调用，10200201 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2900 | testBitVectorValues0001 | values | new BitVector(0) | 空BV迭代器立即done |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2910 | testBitVectorValues0002 | values | new BitVector(0)+push 3 | 非空BV for...of遍历 |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2920 | testBitVectorValues0003 | values | new BitVector(0)+push 3 | next()逐个获取验证 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2930 | testBitVectorValues0007 | values | new BitVector(0)+push 5 | for...of迭代 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2940 | testBitVectorValues0008 | values | new BitVector(0)+push 5 | while循环迭代 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2950 | testBitVectorValues0009 | values | new BitVector(1)+push 1 | 单元素迭代器 |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2960 | testBitVectorValues0010 | values | new BitVector(3)+push 3个0 | 全0迭代 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2970 | testBitVectorValues0011 | values | new BitVector(0)+push 3个1 | 全1迭代 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2980 | testBitVectorValues0012 | values | new BitVector(5)+push 2 | 返回类型验证(function/boolean/number) |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2990 | testBitVectorValues0013 | values | new BitVector(0)+push 1000 | 大BV(1000)迭代 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3000 | testBitVectorValues0014 | values | new BitVector(5)+push 3 | 多迭代器独立性 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3010 | testBitVectorValues0015 | values | new BitVector(3)+push 3 | 迭代器耗尽后done状态 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3020 | testBitVectorValues0017 | values | new BitVector(0)+push 5 | 展开运算符...转数组 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3030 | testBitVectorValues0018 | values | new BitVector(0)+push 5 | Array.from转换 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3040 | testBitVectorValues0019 | values | new BitVector(0)+push 5 | 部分迭代(前3个) |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3050 | testBitVectorValues0021 | values | new BitVector(5)+push 5 | 解构赋值验证 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3060 | testBitVectorValues0022 | values | new BitVector(5)+push 5 | break提前终止 |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3070 | testBitVectorValues0023 | values | new BitVector(5)+push 5 | 迭代顺序验证(从头到尾) |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3080 | testBitVectorValues0024 | values | new BitVector(5)+push 5 | 值一致性验证(0或1) |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3090 | testBitVectorValues0025 | values+flipBitsByRange | new BitVector(0)+push 5 | 修改后重新迭代 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3110 | testBitVectorIterator0001 | [Symbol.iterator] | new BitVector(0) | 空BV迭代 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3120 | testBitVectorIterator0002 | [Symbol.iterator] | new BitVector(0)+push 1 | 单元素迭代 |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3130 | testBitVectorIterator0003 | [Symbol.iterator] | new BitVector(0)+push 5 | 多元素迭代验证 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3140 | testBitVectorIterator0004 | [Symbol.iterator] | new BitVector(0)+push 10 | for...of遍历所有元素 |
| 32 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3150 | testBitVectorIterator0005 | [Symbol.iterator] | new BitVector(0)+push 4 | 迭代顺序从head到tail |
| 33 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3160 | testBitVectorIterator0006 | [Symbol.iterator] | new BitVector(0)+push 2 | next()方法测试 |
| 34 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3170 | testBitVectorIterator0007 | [Symbol.iterator] | new BitVector(0)+push 3 | done属性验证 |
| 35 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3180 | testBitVectorIterator0008 | [Symbol.iterator] | new BitVector(0)+push 4 | value属性验证(number类型) |
| 36 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3190 | testBitVectorIterator0010 | [Symbol.iterator] | new BitVector(0)+push 3 | 迭代中修改BitVector |
| 37 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3200 | testBitVectorIterator0011 | [Symbol.iterator] | new BitVector(0)+push 5 | 与values()方法比较 |
| 38 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3210 | testBitVectorIterator0012 | [Symbol.iterator] | new BitVector(0)+push 100 | 大BV(100)迭代 |
| 39 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3220 | testBitVectorIterator0013 | [Symbol.iterator] | new BitVector(10) | 构造初始length的迭代 |
| 40 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3230 | testBitVectorIterator0014 | [Symbol.iterator] | new BitVector(0)+push 4 | 展开运算符[...bv] |
| 41 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3240 | testBitVectorIterator0015 | [Symbol.iterator] | new BitVector(0)+push 4 | Array.from转换 |
| 42 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3250 | testBitVectorIterator0016 | [Symbol.iterator] | new BitVector(0)+push 4+pop | pop后迭代 |
| 43 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3950 | testBitVectorValuesBoundary0001 | values | new BitVector(0) | 空BV迭代器立即done |
| 44 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3960 | testBitVectorValuesBoundary0002 | values | new BitVector(0)+push 1 | 单元素迭代器 |
| 45 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4820 | testBitVector64Boundary0015 | values+pop | new BitVector(0)+push 64/65 | 64边界：values()+pop(65->64) |

---

## 15. BitVectorIndexAccess.test.ets (22用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | BITVECTOR_TEST_090 | BitVector_index_Func_001 | [index] | new BitVector(0)+push 6 | 字符串类型索引访问返回undefined |
| 2 | SUB_COLLECTIONS_BITVECTOR_TEST_6600 | BitVectorTest6600 | [index] | new BitVector(16)+[5]=1 | 索引get返回正确位值 |
| 3 | SUB_COLLECTIONS_BITVECTOR_TEST_6700 | BitVectorTest6700 | [index] | new BitVector(16) | set和get操作 |
| 4 | SUB_COLLECTIONS_BITVECTOR_TEST_6800 | BitVectorTest6800 | [index] | new BitVector(16) | 超范围索引(16)抛出错误 |
| 5 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3260 | testBitVectorIndex0001 | [index] | new BitVector(0)+push 3 | 首元素index=0访问 |
| 6 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3270 | testBitVectorIndex0002 | [index] | new BitVector(0)+push 3 | 末尾元素index=length-1访问 |
| 7 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3280 | testBitVectorIndex0003 | [index] | new BitVector(0)+push 2 | 返回值类型number验证 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3290 | testBitVectorIndex0004 | [index] | new BitVector(0) | 空BV [0]访问，抛出10200001 |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3300 | testBitVectorIndex0005 | [index] | new BitVector(0)+push 2 | index=length超范围，抛出10200001 |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3310 | testBitVectorIndex0006 | [index] | new BitVector(0)+push 2 | 大索引100000超范围，抛出10200001 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3320 | testBitVectorIndex0007 | [index] | new BitVector(0)+push 2 | 负索引-1，抛出10200001 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3330 | testBitVectorIndex0008 | [index] | new BitVector(0)+push 2 | NaN索引返回undefined |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3340 | testBitVectorIndex0009 | [index] | new BitVector(0)+push 2 | Infinity索引返回undefined |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3350 | testBitVectorIndex0010 | [index] | new BitVector(0)+push 3 | 浮点1.5索引返回undefined |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3360 | testBitVectorIndex0014 | [index] | new BitVector(0)+push 10 | 多索引访问验证 |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3370 | testBitVectorIndex0015 | [index] | new BitVector(10) | 构造初始length的索引访问 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3860 | testBitVectorIndexBoundary0001 | [index] | new BitVector(0)+push 3 | 首元素index=0 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3870 | testBitVectorIndexBoundary0002 | [index] | new BitVector(0)+push 5 | 末尾元素index=length-1 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3880 | testBitVectorIndexBoundary0003 | [index] | new BitVector(0)+push 3 | 超范围index=length，抛出10200001 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_3890 | testBitVectorIndexBoundary0004 | [index] | new BitVector(0)+push 1 | 单元素index=0和index=1超范围 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4570 | testBitVectorEmptyBoundary0009 | [index] | new BitVector(0) | 空BV [0]，抛出10200001 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4800 | testBitVector64Boundary0013 | [index] | new BitVector(0)+push 65 | 64边界：边界索引63,64,65超范围 |

---

## 16. BitVectorUnbound.test.ets (31用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_2540 | testBitVectorGetLastIndexOf0019 | getLastIndexOf | new BitVector(5)+push 5 | 方法解绑调用(setNull)，抛出10200011 |
| 2 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4640 | testBitVectorConcurrentReadLength | length+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool读取length |
| 3 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4650 | testBitVectorConcurrentReadIndex | [index]+taskpool | new BitVector(0)+push 3 | 跨线程TaskPool读取[index] |
| 4 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4660 | testBitVectorConcurrentHas | has+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool调用has() |
| 5 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4670 | testBitVectorConcurrentGetBitCountByRange | getBitCountByRange+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool调用getBitCountByRange() |
| 6 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4680 | testBitVectorConcurrentGetIndexOf | getIndexOf+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool调用getIndexOf() |
| 7 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4690 | testBitVectorConcurrentValuesSum | values+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool迭代values()求和 |
| 8 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4700 | testBitVectorConcurrentPush | push+taskpool | new BitVector(0)+push 2个0 | 跨线程TaskPool push()后主线程验证 |
| 9 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4710 | testBitVectorConcurrentSetAllBits | setAllBits+taskpool | new BitVector(0)+push 5个0 | 跨线程TaskPool setAllBits()后验证 |
| 10 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4720 | testBitVectorConcurrentSetBitsByRange | setBitsByRange+taskpool | new BitVector(0)+push 10个0 | 跨线程TaskPool setBitsByRange()后验证 |
| 11 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4730 | testBitVectorConcurrentFlipBitsByRange | flipBitsByRange+taskpool | new BitVector(0)+push 10 | 跨线程TaskPool flipBitsByRange()后验证 |
| 12 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4740 | testBitVectorConcurrentResize | resize+taskpool | new BitVector(0)+push 3 | 跨线程TaskPool resize()后验证 |
| 13 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4750 | testBitVectorConcurrentMultiRead | length+getBitCountByRange+has+taskpool | new BitVector(0)+push 20 | 多TaskPool任务并发读取同一BV |
| 14 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4760 | testBitVectorConcurrentMultiReadIndex | [index]+taskpool | new BitVector(0)+push 5 | 多TaskPool任务并发读取不同索引 |
| 15 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4770 | testBitVectorConcurrentAllOpsTryCatch | 全接口+taskpool | new BitVector(0)+push 10 | 10轮循环主线程+TaskPool同时调用全接口try-catch |
| 16 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4780 | testBitVectorConcurrentWithLock | 全接口+AsyncLock+taskpool | new BitVector(0)+push 10 | AsyncLock序列化10轮全接口操作 |
| 17 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4820 | testBitVectorMethodBindingPush | push | new BitVector(0)+push 1 | push解绑调用，抛出10200011 |
| 18 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4830 | testBitVectorMethodBindingHas | has | new BitVector(0)+push 2 | has解绑调用，抛出10200011 |
| 19 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4840 | testBitVectorMethodBindingPop | pop | new BitVector(0)+push 1 | pop解绑调用，抛出10200011 |
| 20 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4850 | testBitVectorCrossThreadVisibility | setAllBits+taskpool | new BitVector(0)+push 5个0 | 跨线程修改后主线程立即可见 |
| 21 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4860 | testBitVectorConcurrentCreateInWorker | constructor+taskpool | 无 | Worker线程创建BV返回主线程验证 |
| 22 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4870 | testBitVectorConcurrentCreateAndPopulate | constructor+push+taskpool | 无 | Worker创建并填充BV返回主线程验证 |
| 23 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4880 | testBitVectorConcurrentReturnGetBitsByRange | getBitsByRange+taskpool | new BitVector(0)+push 10 | Worker中getBitsByRange返回BV主线程验证 |
| 24 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4890 | testBitVectorConcurrentWorkerCreatedMainOperates | push+setAllBits+setBitsByRange+taskpool | 无 | Worker创建BV主线程操作(push/has/setBitsByRange) |
| 25 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4900 | testBitVectorConcurrentBoundaryHasToIndexLength | has+taskpool | new BitVector(0)+push 10 | Worker中has(element,0,length)边界 |
| 26 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4910 | testBitVectorConcurrentBoundarySingleElement | 全接口+taskpool | 无 | Worker中单元素BV全操作 |
| 27 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4920 | testBitVectorConcurrentBoundaryEmptyPush | push+taskpool | 无 | Worker中空BV push操作 |
| 28 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4930 | testBitVectorConcurrentBoundaryLargeOps | has+getBitCountByRange+getIndexOf+flipBitsByRange+taskpool | 无 | Worker中大BV(1000)边界操作 |
| 29 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4940 | testBitVectorConcurrentSendData | sendData+taskpool | new BitVector(0)+push 10 | Worker中sendData发送length |
| 30 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4950 | testBitVectorConcurrentErrorOutOfRange | [index]+taskpool | new BitVector(0)+push 2 | Worker中超范围索引错误传播 |
| 31 | SUB_COMMONLIBRARY_ETSUTILS_BITVECTOR_4960 | testBitVectorConcurrentMultiBitVector | setBitsByRange+getBitCountByRange+taskpool | 无 | Worker中多BV操作 |

---

## 17. BitVectorConcurrentSingle.test.ets (8用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | SUB_CONCURRENT_BITVECTOR_TEST_0200 | test_concurrent_collections_bitvector_002 | pop+taskpool | new BitVector(0)+push 1000 | 100并发TaskPool pop验证 |
| 2 | SUB_CONCURRENT_BITVECTOR_TEST_0300 | test_concurrent_collections_bitvector_003 | has+taskpool | new BitVector(0)+push 5 | 100并发TaskPool has验证 |
| 3 | SUB_CONCURRENT_BITVECTOR_TEST_0600 | test_concurrent_collections_bitvector_006 | getBitsByRange+taskpool | new BitVector(0)+push 5 | 100并发TaskPool getBitsByRange验证 |
| 4 | SUB_CONCURRENT_BITVECTOR_TEST_0800 | test_concurrent_collections_bitvector_008 | getBitCountByRange+taskpool | new BitVector(0)+push 5 | 100并发TaskPool getBitCountByRange验证 |
| 5 | SUB_CONCURRENT_BITVECTOR_TEST_0900 | test_concurrent_collections_bitvector_009 | getIndexOf+taskpool | new BitVector(0)+push 5 | 100并发TaskPool getIndexOf验证 |
| 6 | SUB_CONCURRENT_BITVECTOR_TEST_1000 | test_concurrent_collections_bitvector_010 | getLastIndexOf+taskpool | new BitVector(0)+push 5 | 100并发TaskPool getLastIndexOf验证 |
| 7 | SUB_CONCURRENT_BITVECTOR_TEST_1100 | test_concurrent_collections_bitvector_011 | [index]+taskpool | new BitVector(0)+push 5 | 100并发TaskPool [index]访问验证 |
| 8 | SUB_CONCURRENT_BITVECTOR_TEST_1300 | test_concurrent_collections_bitvector_013 | flipBitsByRange+values+taskpool | new BitVector(0)+push 5 | 100并发TaskPool flipBitsByRange+values验证 |

---

## 18. BitVectorConcurrentMulti.test.ets (7用例)

| 序号 | 编号 | 名称 | API | 预置条件 | 场景 |
|------|------|------|-----|---------|------|
| 1 | SUB_CONCURRENT_BITVECTOR_TEST_0100 | test_concurrent_collections_bitvector_001 | push+taskpool | new BitVector(0)+push 5 | 100并发TaskGroup push验证 |
| 2 | SUB_CONCURRENT_BITVECTOR_TEST_0400 | test_concurrent_collections_bitvector_004 | setBitsByRange+taskpool | new BitVector(0)+push 5 | 100并发TaskGroup setBitsByRange验证 |
| 3 | SUB_CONCURRENT_BITVECTOR_TEST_0500 | test_concurrent_collections_bitvector_005 | setAllBits+taskpool | new BitVector(0)+push 5 | 100并发TaskGroup setAllBits验证 |
| 4 | SUB_CONCURRENT_BITVECTOR_TEST_0700 | test_concurrent_collections_bitvector_007 | resize+taskpool | new BitVector(0)+push 5 | 100并发TaskGroup resize验证 |
| 5 | SUB_CONCURRENT_BITVECTOR_TEST_1200 | test_concurrent_collections_bitvector_012 | flipBitByIndex+taskpool | new BitVector(0)+push 5 | 100并发TaskGroup flipBitByIndex验证 |
| 6 | CollectionsTestClass001 | CollectionsTestClass001 | constructor+taskpool | new BitVector(0) | SendableClass传递BitVector到Worker验证 |
| 7 | CollectionsTestClass002 | CollectionsTestClass002 | push+has+taskpool+AsyncLock | 无 | Sendable class+AsyncLock+TaskPool push/has验证 |

---

