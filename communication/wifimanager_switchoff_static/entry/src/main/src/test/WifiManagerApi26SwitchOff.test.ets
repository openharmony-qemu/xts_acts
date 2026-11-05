'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll} from "@ohos/hypium-static/src/main/indexStatic";
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import wifiManager from '@ohos.wifiManager';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testWifiApi26DisableTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function wifiApi26SwitchOffTest() {
  describe("wifiApi26SwitchOffTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      await Utils.closeWifi();
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    });
    afterAll(async (): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'afterAll start');
      await Utils.openWifi();
      hilog.info(domain, tag, '%{public}s', 'afterAll end');
    });
    /**
     * @tc.number SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0001
     * @tc.name SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0001
     * @tc.desc Test disconnectFromCandidateConfig API when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        wifiManager.disconnectFromCandidateConfig(0, 30);
        hilog.info(domain, tag, "disconnectFromCandidateConfig success");
        expect().assertFail();
      }catch(err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "disconnectFromCandidateConfig get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });

    /**
     * @tc.number SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0002
     * @tc.name SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0002
     * @tc.desc Test disconnectFromCandidateConfig API with permanent blockDuration when wifi is disabled
     * @tc.level Level 0
     * @tc.type Function
     * @tc.size MEDIUMTEST
     */
    it("SUB_Communication_WifiManager_DisconnectFromCandidateConfig_Disable_0002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        wifiManager.disconnectFromCandidateConfig(0, -1);
        hilog.info(domain, tag, "disconnectFromCandidateConfig success");
        expect().assertFail();
      }catch(err) {
        hilog.info(domain, tag, "get error:" + JSON.stringify(err));
        hilog.info(domain, tag, "disconnectFromCandidateConfig get errCode:" + err.code + ",errMessage:" + err.message);
        if (err.code === 801) {
          hilog.info(domain, tag, 'api is not support');
          expect(err.code).assertEqual(801);
        } else {
          expect(err.code).assertEqual(2501001);
        }
      }
      done();
    });
  })
}
