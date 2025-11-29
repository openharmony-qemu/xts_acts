/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@ohos.base';
import { GlobalContext, openPNGWithBase64 } from '../test/global';
import application from '@ohos.app.ability.application';


export default function GlobalResMgrTest() {
  describe("GlobalResMgrTest", () => {
    console.log('*************start GlobalResMgrTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @generated.time 2025-11-24
     * @tc.name   GlobalResMgrTest_getMediaContentBase64Sync_0100
     * @tc.number SUB_GLOBAL_ResourceManager_BASE64_0100
     * @tc.desc   get with id
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GlobalResMgrTest_getMediaContentBase64Sync_0100', Level.LEVEL2, () => {
      try {
        let value = res.getMediaContentBase64Sync($r('app.media.foreground').id);
        let path:string = resContext.resourceDir + '/' + "foreground.png";
        let base64 = openPNGWithBase64(path);
        expect(value).assertEqual(base64);

        value = res.getMediaContentBase64Sync($r('app.media.foreground1').id);
        path = resContext.resourceDir + '/' + "foreground1.png";
        base64 = openPNGWithBase64(path);
        expect(value).assertEqual(base64);

        value = res.getMediaContentBase64Sync($r('app.media.foreground2').id);
        path = resContext.resourceDir + '/' + "foreground2.png";
        base64 = openPNGWithBase64(path);
        expect(value).assertEqual(base64);
      } catch(error) {
        expect(JSON.stringify(error)).assertFail();
      }
    })

    /**
     * @generated.time 2025-11-27
     * @tc.name   GlobalResMgrTest_getOverrideResourceManager_0100
     * @tc.number SUB_GLOBAL_ResourceManager_OverrideResourceManager_0100
     * @tc.desc   overrideResourceManager have no effect on raw resourceManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GlobalResMgrTest_getOverrideResourceManager_0100', Level.LEVEL2, () => {
      try {
        let rawValue = res.getStringSync($r('app.string.override_test').id);
        let config = res.getConfigurationSync();
        config.locale = "en_US";
        let overrideResMgr = res.getOverrideResourceManager(config);
        expect(res.getStringSync($r('app.string.override_test').id)).assertEqual(rawValue);
        expect(overrideResMgr.getStringSync($r('app.string.override_test').id)).assertEqual("base str");
        config.locale = "zh_CN";
        overrideResMgr = res.getOverrideResourceManager(config);
        expect(res.getStringSync($r('app.string.override_test').id)).assertEqual(rawValue);
        expect(overrideResMgr.getStringSync($r('app.string.override_test').id)).assertEqual("override str");
      } catch(error) {
        expect(JSON.stringify(error)).assertFail();
      }
    })

    /**
     * @generated.time 2025-11-29
     * @tc.name   GlobalResMgrTest_getSysResourceManager_0100
     * @tc.number SUB_GLOBAL_ResourceManager_SysResourceManager_0100
     * @tc.desc   resmgr which getSysResourceManager return and config of resourcemanager in context is the same
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GlobalResMgrTest_getOverrideResourceManager_0100', Level.LEVEL2, () => {
      try {
        let sysResMgr = res.getSysResourceManager();
        except(sysResMgr.getStringSync()).assertEqual(res.getStringSync())
      } catch(error) {
        expect(JSON.stringify(error)).assertFail();
      }
    })

  })
}