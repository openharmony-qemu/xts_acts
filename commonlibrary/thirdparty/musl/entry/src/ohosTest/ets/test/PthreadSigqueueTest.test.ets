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

import { describe, it, expect } from '@ohos/hypium'
import pthread_sigqueue_test from 'libpthread_sigqueue_test.so'

export default function PthreadSigqueueTest() {
  describe('MuslPthreadSigqueueTest', () => {

    /**
     * @tc.name   testMuslPthreadSigqueue0100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0100
     * @tc.desc   pthread_sigqueue正常发送SIGUSR1到子线程验证sival_int=42
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0100', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0200
     * @tc.desc   pthread_sigqueue传递sival_ptr指针值验证
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0200', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0300
     * @tc.desc   tid为0返回ESRCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0300', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0400
     * @tc.desc   sig为SIGCANCEL(33)返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0400', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0500
     * @tc.desc   sig为SIGTIMER(32)返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0500', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0600
     * @tc.desc   sig为SIGSYNCCALL(34)返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0600', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0700
     * @tc.desc   返回正值errno而不设置errno
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0700', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0800
     * @tc.desc   si_code设为SI_QUEUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0800', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0800();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue0900
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0900
     * @tc.desc   si_pid和si_uid正确填充
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_0900', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_0900();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1000
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1000
     * @tc.desc   __block_app_sigs在syscall前阻塞app信号(Review-Only)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1000', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1000();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1100
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1100
     * @tc.desc   killlock序列化信号发送(Review-Only)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1100', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1100();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1200
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1200
     * @tc.desc   无SYS_rt_tgsigqueueinfo时返回ENOSYS(架构依赖)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1200', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1200();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1300
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1300
     * @tc.desc   权限不足返回EPERM(环境依赖)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1300', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1300();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1400
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1400
     * @tc.desc   非法信号号返回EINVAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1400', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1400();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1500
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1500
     * @tc.desc   目标线程已退出返回ESRCH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1500', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1500();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1600
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1600
     * @tc.desc   单线程发信号后__libc_single_threaded=1(组合)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1600', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1600();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1700
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1700
     * @tc.desc   多线程发信号返回成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1700', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1700();
      expect(data).assertEqual(0);
    });

    /**
     * @tc.name   testMuslPthreadSigqueue1800
     * @tc.number SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1800
     * @tc.desc   siginfo_t栈分配无动态内存(Review-Only)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_THIRDPARTY_MUSL_PTHREAD_SIGQUEUE_1800', 0, () => {
      let data: number = pthread_sigqueue_test.Sigqueue_1800();
      expect(data).assertEqual(0);
    });
  })
}
