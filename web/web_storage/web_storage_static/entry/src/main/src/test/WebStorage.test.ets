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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import webView from '@ohos.web.webview'
let testAbilityContext:common.UIAbilityContext;
let origin: string = "resource://rawfile/"

export default function webStorageTest() {

    describe("webStorageTest", (): void => {
        console.info('describe start');
        beforeAll(() => {
            let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            abilityDelegator.addAbilityMonitor({
                abilityName: "EntryAbility",
                moduleName:"entry",
                onAbilityCreate: (abilitys : UIAbility) : void => {
                testAbilityContext = abilitys.context
                console.info('onAbilityCreate end')
                },
            }, (err : BusinessError<void> | null) : void => {
                if (err != null) {
                    console.info('load error')
                    return;
                }
            });
            await Utils.msSleep(2000)
            abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.actswebstoragetest.static")
            await Utils.msSleep(4000)
            console.info('beforeAll end,%s', 'Succeed!')
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINS_0001
         * @tc.name       : testGetOrigins_static_001
         * @tc.desc       : test getOrigins
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOrigins_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins((error: BusinessError<void>|null, origins: webView.WebStorageOrigin[] | undefined) => {
                    if (error) {
                        console.info('error: ' + JSON.stringify(error));
                        return;
                    }
                    if (origins == null || origins.length == 0) {
                        expect(false).assertTrue();
                        return;
                    }
                    console.info('testGetOrigins_static_001 origins.length: ' + origins.length);
                    for (let i = 0; i < origins.length; i++) {
                        console.info('origin: ' + origins[i].origin);
                        console.info('usage: ' + origins[i].usage);
                        console.info('quota: ' + origins[i].quota);
                    }
                    expect(origins![0].origin == "resource://rawfile/").assertTrue();
                    expect(origins![0].usage > 0).assertTrue();
                    expect(origins![0].quota != 0).assertTrue();
                })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOrigins_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINS_0002
         * @tc.name       : testGetOrigins_static_002
         * @tc.desc       : test getOrigins
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOrigins_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOrigins()
                    .then((origins: webView.WebStorageOrigin[]) => {
                        console.info('testGetOrigins_static_002 origins.length: ' + origins.length);
                        expect(origins!.length > 0).assertTrue();
                        for (let i = 0; i < origins.length; i++) {
                            console.info('origin: ' + origins[i].origin);
                            console.info('usage: ' + origins[i].usage);
                            console.info('quota: ' + origins[i].quota);
                        }
                        expect(origins![0].origin == "resource://rawfile/").assertTrue();
                        expect(origins![0].usage > 0).assertTrue();
                        expect(origins![0].quota != 0).assertTrue();
                    })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOrigins_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0001
         * @tc.name       : testGetOriginUsage_static_001
         * @tc.desc       : test getOriginUsage
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginUsage_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin, (error: BusinessError<void> | null, usage: Double | undefined) => {
                    if (error) {
                        console.info('error: ' + JSON.stringify(error));
                        return;
                    }
                    if (usage == null) {
                        return;
                    }
                    console.info('usage: ' + usage);
                    expect(usage! > 0).assertTrue();
                })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOriginUsage_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINUSAGE_0002
         * @tc.name       : testGetOriginUsage_static_002
         * @tc.desc       : test getOriginUsage
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginUsage_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage: Double) => {
                        console.info('usage: ' + usage);
                        expect(usage! > 0).assertTrue();
                    })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOriginUsage_static_002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0001
         * @tc.name       : testGetOriginQuota_static_001
         * @tc.desc       : test getOriginQuota
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginQuota_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin, (error: BusinessError<void> | null, quota: Double | undefined) => {
                    if (error) {
                        console.info('error: ' + JSON.stringify(error));
                        return;
                    }
                    if (quota == null) {
                        return;
                    }
                    console.info('testGetOriginQuota_static_001 quota: ' + quota);
                    expect(quota! != 0).assertTrue();
                })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOriginQuota_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_GETORIGINQUOTA_0002
         * @tc.name       : testGetOriginQuota_static_002
         * @tc.desc       : test getOriginQuota
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testGetOriginQuota_static_002", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.getOriginQuota(origin)
                    .then((quota : Double) => {
                        console.info('testGetOriginQuota_static_002 quota: ' + quota);
                        expect(quota! != 0).assertTrue();
                    })
            } catch (e) {
                e = e as BusinessError;
                console.info('testGetOriginQuota_static_002 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_DELETEORIGIN_0001
         * @tc.name       : testDeleteOrigin_static_001
         * @tc.desc       : test deleteOrigin
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testDeleteOrigin_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteOrigin(origin);
                await Utils.msSleep(2000);
                webView.WebStorage.getOriginUsage(origin)
                    .then((usage : Double) => {
                        console.info('testDeleteOrigin_static_001usage: ' + usage);
                        expect(usage! == 0).assertTrue();
                    })
            } catch (e) {
                e = e as BusinessError;
                console.info('testDeleteOrigin_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })

        /**
         * @tc.number     : SUB_WEB_WEBSTORAGE_DELETEALLDATA_0001
         * @tc.name       : testDeleteAllData_static_001
         * @tc.desc       : test deleteAllData
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 1
         */
        it("testDeleteAllData_static_001", TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (): Promise<void> => {
            await Utils.msSleep(2000);
            try {
                webView.WebStorage.deleteAllData();
                await Utils.msSleep(2000);
                webView.WebStorage.getOrigins((error: BusinessError<void> | null, origins: webView.WebStorageOrigin[] | undefined) => {
                    if (error) {
                        console.info('error: ' + JSON.stringify(error));
                        return;
                    }
                    if (origins == null || origins.length == 0) {
                        expect(false).assertTrue();
                        return;
                    }
                    console.info('testDeleteAllData_static_001 origins length: ' + origins.length);
                    for (let i = 0; i < origins.length; i++) {
                        console.info('origin: ' + origins[i].origin);
                        console.info('usage: ' + origins[i].usage);
                        console.info('quota: ' + origins[i].quota);
                    }
                    expect(origins![0].usage == 0).assertTrue();
                })
            } catch (e) {
                e = e as BusinessError;
                console.info('testDeleteAllData_static_001 has failed for' + JSON.stringify(e));
                expect(false).assertTrue();
            }
        })
    })

}