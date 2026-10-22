/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility'
import Logger from '../model/Logger'
import common from '@ohos.app.ability.common';
import { UIExtensionContentSession } from '@kit.AbilityKit';


const TAG: string = '[UIExtAbility]'

export default class UIExtAbility extends UIExtensionAbility {
    onCreate() {
        Logger.log(TAG, `UIExtAbility onCreate`)
		let uiExtensionContext:common.UIExtensionContext = this.context;
        globalThis.context2 = this.context;
    }

    onForeground() {
        Logger.log(TAG, `UIExtAbility onForeground`)
    }

    onBackground() {
        Logger.log(TAG, `UIExtAbility onBackground`)
    }

    onDestroy() {
        Logger.log(TAG, `UIExtAbility onDestroy`)
    }

onSessionCreate(want: Want, session: UIExtensionContentSession) {
        Logger.log(TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`)
        let storage: LocalStorage = new LocalStorage(({
            'session': session
        }) as Record<string, Object>);
        session.loadContent('pages/index', storage);
    }

onSessionDestroy(session: UIExtensionContentSession) {
        Logger.log(TAG, `UIExtAbility onSessionDestroy`)
    }
};
