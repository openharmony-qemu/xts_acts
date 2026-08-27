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

const AE_DOMAIN = 0x0000;

export default function AutoEffectTest() {
  describe('AutoEffectTest', () => {
    beforeAll(() => {
      libAutoEffectTest.initTests();
      hilog.info(AE_DOMAIN, 'AutoEffectTest', 'beforeAll setReadyCallback start');
      libAutoEffectTest.setReadyCallback((ready: boolean) => {
        hilog.info(AE_DOMAIN, 'AutoEffectTest', 'readyCallback fired ready=%{public}s', String(ready));
        if (ready) {
          const name = libAutoEffectTest.GetCurrentXComponentName();
          hilog.info(AE_DOMAIN, 'AutoEffectTest', 'xComponentName=%{public}s', name);
          AppStorage.setOrCreate('xComponentName', name);
        }
        AppStorage.setOrCreate('xComponentReady', ready);
      });
      hilog.info(AE_DOMAIN, 'AutoEffectTest', 'beforeAll setReadyCallback done');
    })
    beforeEach(() => {})
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00100
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00100
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name=NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00100', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00200
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00200
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00200', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00300
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00300
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param=NULL
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00300', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00400
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00400
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL和param=NULL
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00400', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00500
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00500
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00500', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00600
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00600
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00600', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00700
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00700
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00700', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00800
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00800
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00800', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_00900
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_00900
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_00900', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01000
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01000
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01000', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01100
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01100
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01100', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01200
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01200
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01200', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01300
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01300
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01300', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01400
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01400
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name未经过UseAutoEffect注册
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01400', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01500
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01500
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_ENABLE
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01500', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01600
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01600
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_AISR_STRENGTH
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01600', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01700
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01700
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=-1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01700', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01800
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01800
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=2
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01800', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_01900
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_01900
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=2
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_01900', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02000
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02000
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=-1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02000', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02100
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02100
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02100', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02200
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02200
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0.5
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02200', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02300
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02300
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02300', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02500
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02500
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=""
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02500', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02600
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02600
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name是超长字符串
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02600', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02700
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02700
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name是超长字符串
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02700', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_02900
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_02900
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name包含特殊字符
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_02900', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_03000
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_03000
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_03000', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest03000();
      expect(result).assertEqual(0);
      done();
    })
  })
}
