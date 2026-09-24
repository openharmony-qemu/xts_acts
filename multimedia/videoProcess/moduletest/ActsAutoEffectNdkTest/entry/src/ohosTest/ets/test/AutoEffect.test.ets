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
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0010
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0010
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name=NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0010', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0020
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0020
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0020', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0030
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0030
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param=NULL
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0030', Level.LEVEL0, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0040
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0040
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=NULL和param=NULL
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0040', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0050
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0050
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0050', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0060
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0060
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0060', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0070
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0070
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0070', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0080
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0080
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0080', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0090
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0090
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0090', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest00900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0100
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0100
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=uint32_max
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0100', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0110
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0110
     * @tc.desc   OH_VideoProcessing_IsAutoEffectSupported入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0110', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0120
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0120
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0120', Level.LEVEL1, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0130
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0130
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参type=不支持的枚举
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0130', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0140
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0140
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name未经过UseAutoEffect注册
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0140', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01400();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0150
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0150
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_ENABLE
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0150', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0160
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0160
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param不设置VIDEO_AUTOEFFECT_AISR_STRENGTH
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0160', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0170
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0170
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=-1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0170', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0180
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0180
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=2
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0180', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01800();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0190
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0190
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=2
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0190', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest01900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0200
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0200
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=-1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0200', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02000();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0210
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0210
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0210', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02100();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0220
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0220
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=0.5
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0220', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02200();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0230
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0230
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_AISR_STRENGTH=1
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0230', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02300();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0250
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0250
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name=""
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0250', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02500();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0260
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0260
     * @tc.desc   OH_VideoProcessing_UseAutoEffect入参name是超长字符串
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0260', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02600();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0270
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0270
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name是超长字符串
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0270', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02700();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0290
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0290
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参name包含特殊字符
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0290', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest02900();
      expect(result).assertEqual(0);
      done();
    })

    /**
     * @tc.name   SUB_VPE_AUTOEFFECT_API_TEST_0300
     * @tc.number SUB_VPE_AUTOEFFECT_API_TEST_0300
     * @tc.desc   OH_VideoProcessing_SetAutoEffectParam入参param设置VIDEO_AUTOEFFECT_ENABLE=0
     */
    it('SUB_VPE_AUTOEFFECT_API_TEST_0300', Level.LEVEL2, async (done: Function) => {
      const result = await libAutoEffectTest.AutoEffectApiTest03000();
      expect(result).assertEqual(0);
      done();
    })
  })
}
