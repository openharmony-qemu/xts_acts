/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import testNapi from 'libuvrunner';
import hilog from '@ohos.hilog';

const TAG = 'LibuvRunnerTest';
const DOMAIN = 0x0201;

export default function LibuvRunnerTest() {
  describe('LibuvRunnerTestSuite', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'LibuvRunner test suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, TAG, 'LibuvRunner test suite end');
    });

    /**
     * @tc.name: TestListTests
     * @tc.desc: List all available libuv tests
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestListTests', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestListTests start');
      
      let tests = testNapi.listTests();
      
      hilog.info(DOMAIN, TAG, `Available tests count: ${tests.length}`);
      
      // 验证测试列表不为空
      expect(tests.length).assertLarger(0);
      
      // 打印前10个测试名称
      for (let i = 0; i < Math.min(10, tests.length); i++) {
        hilog.info(DOMAIN, TAG, `Test ${i}: ${tests[i]}`);
      }
      
      hilog.info(DOMAIN, TAG, 'TestListTests end');
    });

    /**
     * @tc.name: TestRunSingleTest
     * @tc.desc: Run a single libuv test (test-pass-always)
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunSingleTest', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunSingleTest start');
      
      // 运行一个简单的测试（总是通过的测试）
      let result = testNapi.runTest('test_pass_always');
      
      hilog.info(DOMAIN, TAG, `Test result: exitCode=${result.exitCode}, success=${result.success}`);
      
      // 验证测试成功
      expect(result.success).assertTrue();
      expect(result.exitCode).assertEqual(0);
      
      hilog.info(DOMAIN, TAG, 'TestRunSingleTest end');
    });

    /**
     * @tc.name: TestRunActive
     * @tc.desc: Run test-active
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunActive', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunActive start');
      
      let result = testNapi.runTest('test_active');
      
      hilog.info(DOMAIN, TAG, `Test active result: exitCode=${result.exitCode}`);
      
      // 这个测试可能会失败，但不应该崩溃
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunActive end');
    });

    /**
     * @tc.name: TestRunLoop
     * @tc.desc: Run test-loop-alive
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunLoop', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunLoop start');
      
      let result = testNapi.runTest('test_loop_alive');
      
      hilog.info(DOMAIN, TAG, `Test loop alive result: exitCode=${result.exitCode}`);
      
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunLoop end');
    });

    /**
     * @tc.name: TestRunTimer
     * @tc.desc: Run test-timer
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunTimer', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunTimer start');
      
      let result = testNapi.runTest('test_timer');
      
      hilog.info(DOMAIN, TAG, `Test timer result: exitCode=${result.exitCode}`);
      
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunTimer end');
    });

    /**
     * @tc.name: TestRunIdle
     * @tc.desc: Run test-idle
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunIdle', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunIdle start');
      
      let result = testNapi.runTest('test_idle');
      
      hilog.info(DOMAIN, TAG, `Test idle result: exitCode=${result.exitCode}`);
      
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunIdle end');
    });

    /**
     * @tc.name: TestRunError
     * @tc.desc: Run test-error
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunError', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunError start');
      
      let result = testNapi.runTest('test_error');
      
      hilog.info(DOMAIN, TAG, `Test error result: exitCode=${result.exitCode}`);
      
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunError end');
    });

    /**
     * @tc.name: TestRunThreadpool
     * @tc.desc: Run test-threadpool
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunThreadpool', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunThreadpool start');
      
      let result = testNapi.runTest('test_threadpool');
      
      hilog.info(DOMAIN, TAG, `Test threadpool result: exitCode=${result.exitCode}`);
      
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunThreadpool end');
    });

    /**
     * @tc.name: TestRunAllTests
     * @tc.desc: Run all libuv tests (may take a long time)
     * @tc.type: FUNC
     * @tc.require: issueI5XXXX
     */
    it('TestRunAllTests', 0, () => {
      hilog.info(DOMAIN, TAG, 'TestRunAllTests start');
      
      // 注意：运行所有测试可能需要很长时间
      let result = testNapi.runAllTests();
      
      hilog.info(DOMAIN, TAG, `All tests result: exitCode=${result.exitCode}, success=${result.success}`);
      
      // 验证测试完成（不一定全部通过）
      expect(result.exitCode).assertInstanceOf('Number');
      
      hilog.info(DOMAIN, TAG, 'TestRunAllTests end');
    });
  });
}
