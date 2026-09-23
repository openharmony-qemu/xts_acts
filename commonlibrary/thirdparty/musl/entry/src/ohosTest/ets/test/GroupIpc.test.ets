/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { beforeEach, describe, expect, it , TestType, Size, Level } from "@ohos/hypium-dynamic"
import Utils from './Utils'
import groupipc from 'libgroupipc.so'

export default function GroupIpcTest() {
  describe('MuslGroupIpcTest', () => {
    beforeEach(async () => { await Utils.sleep(50) })

    /**
     * @tc.name   testMuslGroupIpcTest0100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0100
     * @tc.desc   group_shm_open非法名字"/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0200
     * @tc.desc   group_shm_open非法名字空串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0300
     * @tc.desc   group_shm_open非法名字"foo/bar"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0400
     * @tc.desc   group_shm_open非法名字"foo/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0500
     * @tc.desc   group_shm_open非法名字"."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0600
     * @tc.desc   group_shm_open非法名字".."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0700
     * @tc.desc   group_shm_unlink非法名字"/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0800
     * @tc.desc   group_shm_unlink非法名字空串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest0900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_0900
     * @tc.desc   group_shm_unlink非法名字"foo/bar"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest0900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_0900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1000
     * @tc.desc   group_shm_unlink非法名字"foo/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1100
     * @tc.desc   group_shm_unlink非法名字"."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1200
     * @tc.desc   group_shm_unlink非法名字".."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1300
     * @tc.desc   group_sem_open非法名字"/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1400
     * @tc.desc   group_sem_open非法名字空串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1500
     * @tc.desc   group_sem_open非法名字"foo/bar"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1600
     * @tc.desc   group_sem_open非法名字"foo/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1700
     * @tc.desc   group_sem_open非法名字"."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1800
     * @tc.desc   group_sem_open非法名字".."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest1900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_1900
     * @tc.desc   group_sem_unlink非法名字"/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest1900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_1900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2000
     * @tc.desc   group_sem_unlink非法名字空串返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2100
     * @tc.desc   group_sem_unlink非法名字"foo/bar"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2200
     * @tc.desc   group_sem_unlink非法名字"foo/"返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2300
     * @tc.desc   group_sem_unlink非法名字"."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2400
     * @tc.desc   group_sem_unlink非法名字".."返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2500
     * @tc.desc   group_shm_open超长名(NAME_MAX+1)返回ENAMETOOLONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2600
     * @tc.desc   group_shm_unlink超长名返回ENAMETOOLONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2700
     * @tc.desc   group_sem_open超长名返回ENAMETOOLONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2800
     * @tc.desc   group_sem_unlink超长名返回ENAMETOOLONG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest2800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest2900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_2900
     * @tc.desc   group_shm_open合法名但组目录缺失返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest2900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_2900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3000
     * @tc.desc   group_shm_unlink合法名但组目录缺失返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3100
     * @tc.desc   group_sem_open合法名但组目录缺失返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3200
     * @tc.desc   group_sem_unlink合法名但组目录缺失返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3300
     * @tc.desc   group_sem_open初值超SEM_VALUE_MAX返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3400
     * @tc.desc   group_shm_open新建成功且强制O_CLOEXEC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3500
     * @tc.desc   group_shm_open重开已存在对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3600
     * @tc.desc   group_shm_open O_CREAT|O_EXCL已存在返回EEXIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3700
     * @tc.desc   group_shm_open组目录无权限返回EACCES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest3700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3800
     * @tc.desc   group_shm_unlink成功后open返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest3800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest3900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_3900
     * @tc.desc   group_shm_unlink对象不存在(目录在)返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest3900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_3900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4000
     * @tc.desc   group_sem_open新建成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest4000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4100
     * @tc.desc   group_sem_open初值0成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest4100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4200
     * @tc.desc   group_sem_open已存在返回EEXIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest4200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4300
     * @tc.desc   group_sem_open inode去重返回同映射
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest4300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4400
     * @tc.desc   group_sem_unlink成功后open返回ENOENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest4400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4500
     * @tc.desc   group_sem_open oflag位掩码O_RDWR被丢弃仍成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest4500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4600
     * @tc.desc   group_shm unlink后旧映射仍有效且重建对象隔离
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest4600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4700
     * @tc.desc   group_shm O_TRUNC归零与只读重读一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest4700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4800
     * @tc.desc   group_sem unlink后旧句柄仍有效且重建独立
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMuslGroupIpcTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const caseName: string = 'testMuslGroupIpcTest4800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest4900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_4900
     * @tc.desc   group_sem getvalue/wait/trywait(EAGAIN)/post基本操作
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest4900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_4900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5000
     * @tc.desc   group_sem初值SEM_VALUE_MAX成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5100
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5100
     * @tc.desc   group对象操作不改变组目录属性
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5100';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5100() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5200
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5200
     * @tc.desc   group_shm umask影响权限0666&~0027=0640
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest5200';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5200() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5300
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5300
     * @tc.desc   多线程并发group_shm_open同名读一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5300';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5300() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5400
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5400
     * @tc.desc   多线程group_shm_open O_CREAT|O_EXCL竞态恰一成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5400';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5400() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5500
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5500
     * @tc.desc   多线程并发group_sem_open同名值一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5500';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5500() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5600
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5600
     * @tc.desc   多线程group_sem_open O_CREAT|O_EXCL竞态恰一成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMuslGroupIpcTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const caseName: string = 'testMuslGroupIpcTest5600';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5600() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5700
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5700
     * @tc.desc   稳定性group_shm_open/close/unlink高频循环无崩溃
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest5700';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5700() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5800
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5800
     * @tc.desc   稳定性group_sem_open/close/unlink高频循环无槽位耗尽
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest5800';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5800() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest5900
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_5900
     * @tc.desc   内存泄漏group_shm循环后对象完全清理
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest5900';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_5900() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });

    /**
     * @tc.name   testMuslGroupIpcTest6000
     * @tc.number SUB_THIRDPARTY_MUSL_GROUP_IPC_6000
     * @tc.desc   内存泄漏group_sem循环后无tmp残留且无槽位泄漏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMuslGroupIpcTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const caseName: string = 'testMuslGroupIpcTest6000';
      console.info(`${caseName} START`);
      const result: number = groupipc.GroupIpc_6000() as number;
      expect(result).assertEqual(0);
      console.info(`${caseName} END`);
    });
  })
}
