/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper'
import { describe, it, expect, beforeAll, Level } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { getPermission,driveFn,sleep } from '../common';

export default function setAssetCompatibleCapabilityTest () {
  describe('setAssetCompatibleCapabilityTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;
    const helper: photoAccessHelper.PhotoAccessHelper = photoAccessHelper.getPhotoAccessHelper(testContext);

    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0100
     * @tc.name      : setAssetCompatibleCapability_0100
     * @tc.desc      : supportedHighResolution is true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setAssetCompatibleCapability_0100', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0100';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            console.info(`${testNum} setAssetCompatibleCapability begin`);
            await helper.setAssetCompatibleCapability(cfg);
            console.info(`${testNum} setAssetCompatibleCapability succeed`);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0200
     * @tc.name      : setAssetCompatibleCapability_0200
     * @tc.desc      : supportedHighResolution is false
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('setAssetCompatibleCapability_0200', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0200';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: false,
            };
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0300
     * @tc.name      : setAssetCompatibleCapability_0300
     * @tc.desc      : supportedHighResolution is undefined, error code is: 23800151
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setAssetCompatibleCapability_0300', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0300';
        let abnormalResolution: ESObject = undefined;
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: abnormalResolution,
            };
            await helper.setAssetCompatibleCapability(cfg);
            expect().assertFalse();
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(Number(error.code)).assertEqual(23800151);
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0400
     * @tc.name      : setAssetCompatibleCapability_0400
     * @tc.desc      : supportedHighResolution is null, error code is: 23800151
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('setAssetCompatibleCapability_0400', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0400';
        let abnormalResolution: ESObject = null;
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: abnormalResolution,
            };
            await helper.setAssetCompatibleCapability(cfg);
            expect().assertFalse();
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(Number(error.code)).assertEqual(23800151);
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0500
     * @tc.name      : setAssetCompatibleCapability_0500
     * @tc.desc      : supportedHighResolution is true twice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('setAssetCompatibleCapability_0500', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0500';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            await helper.setAssetCompatibleCapability(cfg);
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0600
     * @tc.name      : setAssetCompatibleCapability_0600
     * @tc.desc      : supportedHighResolution is false twice
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('setAssetCompatibleCapability_0600', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0600';
        try {
            let cfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            await helper.setAssetCompatibleCapability(cfg);
            await helper.setAssetCompatibleCapability(cfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

    /**
     * @tc.number    : Sub_MultiMedia_MediaLibrary_setAssetCompatibleCapability_Test_0700
     * @tc.name      : setAssetCompatibleCapability_0700
     * @tc.desc      : supportedHighResolution is false and true
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('setAssetCompatibleCapability_0700', Level.LEVEL0, async (done: Function) => {
        let testNum: string = 'setAssetCompatibleCapability_0700';
        try {
            let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: false,
            };
            let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
                supportedHighResolution: true,
            };
            await helper.setAssetCompatibleCapability(firstCfg);
            await helper.setAssetCompatibleCapability(secondCfg);
            done();
        } catch (error) {
            console.error(`${testNum} fail, error is ${error}, ${error.code}`);
            expect(false).assertTrue();
            done();
        }
    })

  })
}
