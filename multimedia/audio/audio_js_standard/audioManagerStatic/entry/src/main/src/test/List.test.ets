import audioManagerApi9 from "./AudioManagerApi9.test";
import audioFramework from "./AudioFramework.test";
import getAudioSceneApi12 from "./GetAudioScene.test"
import audioRoutingManager from "./AudioRoutingManager.test"
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let getPermission = async () => {
    try {
        let g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MANAGE_AUDIO_CONFIG')
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
            (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
                console.info("request success permissions" + JSON.stringify(data));
                console.info("getPermissionRequestResult err" + JSON.stringify(err));
            });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
            await permissionButton.click();
        }
    } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
    }
}

export default function testsuite() {
    getPermission();
    audioManagerApi9();
    audioFramework();
    audioRoutingManager();
    getAudioSceneApi12();
}
