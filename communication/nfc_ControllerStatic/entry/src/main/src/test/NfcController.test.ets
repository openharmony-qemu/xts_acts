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

import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import controller from '@ohos.nfc.controller';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
// import tag from '@ohos.nfc.tag';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level,TestType,Size} from '../../../hypium/index';
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function nfcControllerTest() {
    describe("nfcControllerTest", (): void=> {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        beforeAll(() => {
            hilog.info(domain, tag, '%{public}s','beforeAll called');
        })
        beforeEach(() => {
            hilog.info(domain, tag, '%{public}s','beforeEach called');
        })
        afterEach(() => {
            hilog.info(domain, tag, '%{public}s','afterEach called');
        })
        afterAll(() => {
            hilog.info(domain,tag, '%{public}s','afterAll called');
        })
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_static_0100
         * @tc.name isNfcOpen
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
        */
        it('SUB_COMMUNICATION_NFC_Cont_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            let nfcswitchis:boolean = controller.isNfcOpen();
            if (nfcswitchis == true) {
                hilog.info(domain,tag,'%{public}s','[NFC_test] controller3 Nfc isopenstate is ->' + nfcswitchis);
                expect(nfcswitchis).assertTrue();
            } else if (nfcswitchis == false){
                hilog.info(domain,tag,'%{public}s','[NFC_test] controller3 Nfc isopenstate is ->' + nfcswitchis);
                expect().assertFail();
            }
            done();
        })
        /**
         * @tc.number SUB_COMMUNICATION_NFC_Cont_static_0200
         * @tc.name getNfcState
         * @tc.desc Check whether the NFC function is enabled.
         * @tc.size since 7
         * @tc.type Function
         * @tc.level Level 1
         */

        it('SUB_COMMUNICATION_NFC_Cont_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done: () => void): Promise<void> => {
            let checkopennfc:controller.NfcState =  controller.getNfcState();
            hilog.info(domain,tag,'%{public}s','[NFC_test] checkopen the state of nfc ->' + checkopennfc);
            expect(checkopennfc).assertEqual(3);
            done();
        })

        console.info("*************[nfc_test] start nfc js unit test end*************");
    })
}