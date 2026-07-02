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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import entry from 'libentry.so';

const TAG = 'AsyncContextTest';

export default function HiDeBugAsyncContextTest() {
  describe('HiDeBugAsyncContextTest', () => {
    beforeAll(() => {
      console.info(`${TAG} beforeAll start`);
    })
    beforeEach(() => {
      console.info(`${TAG} beforeEach start`);
    })
    afterEach(() => {
      console.info(`${TAG} afterEach start`);
    })
    afterAll(() => {
      console.info(`${TAG} afterAll start`);
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0100
     * @tc.name testAcquireAsyncContext01
     * @tc.desc 验证OH_HiDebug_AcquireAsyncContext接口正常调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testAcquireAsyncContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0100 start");
      try {
        let ctx = entry.testAcquireAsyncContext();
        expect(ctx === 0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0100 ctx: ${ctx}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0200
     * @tc.name testAcquireAsyncContext02
     * @tc.desc 验证OH_HiDebug_AcquireAsyncContext多次调用获取不同context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testAcquireAsyncContext02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0200 start");
      try {
        let contexts = entry.testAcquireAsyncContextMultiple();
        expect(contexts.ctx0 === 0 ).assertTrue;
        expect(contexts.ctx1 === 0 ).assertTrue;
        expect(contexts.ctx2 === 0 ).assertTrue;
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_AcquireAsyncContext_0200 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_AcquireAndRelease_0100
     * @tc.name testAcquireAndRelease01
     * @tc.desc 验证获取和释放async context的完整流程
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testAcquireAndRelease01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_AcquireAndRelease_0100 start");
      try {
        let result = entry.testAcquireAndRelease();
        expect(result === 0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_AcquireAndRelease_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_AcquireAndRelease_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_PushAsyncContext_0100
     * @tc.name testPushAsyncContext01
     * @tc.desc 验证OH_HiDebug_PushAsyncContext接口正常调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPushAsyncContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_PushAsyncContext_0100 start");
      try {
        let ctx = entry.testAcquireAsyncContext();
        expect(ctx === 0 ).assertTrue;

        let result = entry.testPushAsyncContext(ctx);
        expect(result === 0 ).assertTrue;

        entry.testReleaseAsyncContext(ctx);
        console.info(`SUB_DFX_DFR_HiDebug_PushAsyncContext_0100 success`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_PushAsyncContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_PopAsyncContext_0100
     * @tc.name testPopAsyncContext01
     * @tc.desc 验证OH_HiDebug_PopAsyncContext接口正常调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPopAsyncContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_PopAsyncContext_0100 start");
      try {
        let ctx = entry.testAcquireAsyncContext();
        expect(ctx === 0 ).assertTrue;
        entry.testPushAsyncContext(ctx);
        let result = entry.testPopAsyncContext(ctx);
        expect(result === 0 ).assertTrue;

        entry.testReleaseAsyncContext(ctx);
        console.info(`SUB_DFX_DFR_HiDebug_PopAsyncContext_0100 success`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_PopAsyncContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ReleaseAsyncContext_0100
     * @tc.name testReleaseAsyncContext01
     * @tc.desc 验证OH_HiDebug_ReleaseAsyncContext接口正常调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testReleaseAsyncContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ReleaseAsyncContext_0100 start");
      try {
        let ctx = entry.testAcquireAsyncContext();
        expect(ctx === 0 ).assertTrue;
        let result = entry.testReleaseAsyncContext(ctx);
        expect(result === 0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_ReleaseAsyncContext_0100 success`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ReleaseAsyncContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_PushPopSequence_0100
     * @tc.name testPushPopSequence01
     * @tc.desc 验证Push和Pop的顺序调用
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPushPopSequence01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_PushPopSequence_0100 start");
      try {
        let result = entry.testPushPopSequence();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_PushPopSequence_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_PushPopSequence_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_MultipleContextsPushPop_0100
     * @tc.name testMultipleContextsPushPop01
     * @tc.desc 验证多个Context的Push和Pop操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testMultipleContextsPushPop01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_MultipleContextsPushPop_0100 start");
      try {
        let result = entry.testMultipleContextsPushPop();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_MultipleContextsPushPop_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_MultipleContextsPushPop_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ContextStress_0100
     * @tc.name testContextStress01
     * @tc.desc 验证Context的获取和释放压力测试
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testContextStress01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ContextStress_0100 start");
      try {
        let result = entry.testContextStress();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_ContextStress_0100 success count: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ContextStress_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_PushWithoutPop_0100
     * @tc.name testPushWithoutPop01
     * @tc.desc 验证Push后不Pop直接释放
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testPushWithoutPop01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_PushWithoutPop_0100 start");
      try {
        let result = entry.testPushWithoutPop();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_PushWithoutPop_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_PushWithoutPop_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_InvalidContext_0100
     * @tc.name testInvalidContext01
     * @tc.desc 验证使用无效Context调用接口
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testInvalidContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_InvalidContext_0100 start");
      try {
        let result = entry.testInvalidContext();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_InvalidContext_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_InvalidContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_ZeroContext_0100
     * @tc.name testZeroContext01
     * @tc.desc 验证使用零Context调用接口
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testZeroContext01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_ZeroContext_0100 start");
      try {
        let result = entry.testZeroContext();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_ZeroContext_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_ZeroContext_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DFX_DFR_HiDebug_NestedPushPop_0100
     * @tc.name testNestedPushPop01
     * @tc.desc 验证嵌套的Push和Pop操作
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level2
     */
    it('testNestedPushPop01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info("SUB_DFX_DFR_HiDebug_NestedPushPop_0100 start");
      try {
        let result = entry.testNestedPushPop();
        expect(result >=0 ).assertTrue;
        console.info(`SUB_DFX_DFR_HiDebug_NestedPushPop_0100 success: ${result}`);
        done();
      } catch (err) {
        console.error(`SUB_DFX_DFR_HiDebug_NestedPushPop_0100 > err code: ${err.code}, err msg: ${err.message}`)
        expect(false).assertTrue();
        done();
      }
    })
  })
}