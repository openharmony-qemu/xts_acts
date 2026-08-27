/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import libAutoEffectTest from 'libautoeffecttest.so';
import { hilog } from '@kit.PerformanceAnalysisKit';

const FT_DOMAIN = 0x0000;

export default function FunctionTest() {
  describe('FunctionTest', () => {
    beforeAll(() => {
      hilog.info(FT_DOMAIN, 'FunctionTest', 'beforeAll setReadyCallback start');
      libAutoEffectTest.setReadyCallback((ready: boolean) => {
        hilog.info(FT_DOMAIN, 'FunctionTest', 'readyCallback fired ready=%{public}s', String(ready));
        if (ready) {
          const name = libAutoEffectTest.GetCurrentXComponentName();
          hilog.info(FT_DOMAIN, 'FunctionTest', 'xComponentName=%{public}s', name);
          AppStorage.setOrCreate('xComponentName', name);
        }
        AppStorage.setOrCreate('xComponentReady', ready);
      });
      libAutoEffectTest.setReadyCallback2((ready: boolean) => {
        hilog.info(FT_DOMAIN, 'FunctionTest', 'readyCallback2 fired ready=%{public}s', String(ready));
        if (ready) {
          const name = libAutoEffectTest.GetCurrentXComponentName2();
          hilog.info(FT_DOMAIN, 'FunctionTest', 'xComponentName2=%{public}s', name);
          AppStorage.setOrCreate('xComponentName2', name);
        }
        AppStorage.setOrCreate('xComponentReady2', ready);
      });
      hilog.info(FT_DOMAIN, 'FunctionTest', 'beforeAll setReadyCallback done');
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00100
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00100
     * @tc.desc   查询支持，完整功能流程，enable=true，设置参数(0/0.5/1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00100', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00200
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00200
     * @tc.desc   查询支持，完整功能流程，enable=false，设置参数(0/0.5/1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00200', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00300
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00300
     * @tc.desc   查询支持，错误流程，先SetAutoEffectParam再UseAutoEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00300', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00400
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00400
     * @tc.desc   查询支持，2个XComponent，A使能true，B使能false，设置参数(0/0.5/1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00400', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00500
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00500
     * @tc.desc   查询支持，2个XComponent，A使能true，B使能true，设置参数(0/0.5/1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00500', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00600
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00600
     * @tc.desc   查询不支持，调用UseAutoEffect预期返回错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00600', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00700
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00700
     * @tc.desc   查询不支持，调用SetAutoEffectParam预期返回错误码
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00700', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00800
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00800
     * @tc.desc   查询不支持，重复调用UseAutoEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00800', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_FUNC_TEST_00900
     * @tc.number SUB_VPE_AUTOEFFECT_FUNC_TEST_00900
     * @tc.desc   查询支持，重复调用UseAutoEffect
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_VPE_AUTOEFFECT_FUNC_TEST_00900', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectFuncTest00900();
      expect(result).assertEqual(0);
      done();
    })
  })
}
