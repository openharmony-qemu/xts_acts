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
import { describe, it, expect, TestType, Size, Level, beforeAll } from '../../../hypium/index';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import display from '@ohos.display';
import floatingBall from '@ohos.window.floatingBall';
import type { BusinessError, AsyncCallback, Callback } from '@ohos.base';
import window from '@ohos.window';
import settings from '@ohos.settings';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';
import Want from '@ohos.app.ability.Want';
import bundleManager from '@ohos.bundle.bundleManager';
import StartOptions from '@ohos.app.ability.StartOptions';
import screenshot from '@ohos.screenshot';
import { image } from '@kit.ImageKit';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions) : Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        let want: Want = {
            bundleName: "com.example.actswindowtest.static",
            abilityName: 'StartAbility'
        };
        if (options) {
            context.startAbility(want, options).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        } else {
            context.startAbility(want).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error):PromiseLike<void>|undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        }
        waitForCompletion(() => Utils.msSleep(1000))
        let windowStageStart:window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        resolve(windowStageStart);
    })
}
async function terminateAbility(caseName: string) {
    let pageContext:common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    try {
        if (pageContext !== null && pageContext !== undefined) {
            hilog.info(domain, tag,`${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            hilog.info(domain, tag,`${caseName} terminateSelf success`);
        }).catch((err: Error):PromiseLike<void>|undefined => {
            hilog.error(domain, tag,`${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        hilog.error(domain, tag,`${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}
export default function ErrorCode1300002(): void  {

    describe("ErrorCode1300002", (): void => {
        hilog.info(domain, tag, '%{public}s', 'ErrorCode1300002 describe start');
        hilog.info(domain, tag, 'DisplayTest start');
        let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext | undefined;
        let isPCStatus: string = '';
        beforeAll(async () => {
            hilog.info(domain, tag, 'beforeAll start');
            let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
            hilog.info(domain, tag, 'beforeAll AbilityDelegator');
            let cmd = "aa start -a EntryAbility -b com.example.actswindowtest.static";
            let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
            if(user !== undefined){
                cmd += ' -u ' + user;
            }
            abilityDelegator.executeShellCommand(cmd)
            await Utils.msSleep(2000);
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                hilog.info(domain, tag, 'jsUnittest beforeAll windowStage =' + windowStage);
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                hilog.info(domain, tag, 'jsUnittest beforeAll win =' + win);
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                hilog.info(domain, tag, 'jsUnittest beforeAll context =' + context);
                isPCStatus = settings.getValueSync(context!, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
                //isPCStatus == '' 非PC设备
                //isPCStatus == '1' PC设备状态栏dock未融合
                //isPCStatus == '0' PC设备状态栏dock融合
                hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

        })

    /**
     * @tc.name   testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.number testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.desc   testEnableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEnableLandscapeMultiWindowPromiseErrCode1300002_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = "testEnableLandscapeMultiWindowPromiseErrCode1300002_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';        
        try {
          console.log(msgStr + 'begin.');
          let subWin: window.Window = await windowStage!.createSubWindow('testEnableLandscapeMultiWindowPromise1')
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
          await (subWin! as window.Window).destroyWindow();
          await (subWin! as window.Window).enableLandscapeMultiWindow().then(async () => {
            console.info(msgStr + 'Succeeded in calling enableLandscapeMultiWindow.');
            expect().assertFail();
            done();
          }).catch(async (err: Error) => {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message!=null).assertTrue();
            done();
          });
          
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call enableLandscapeMultiWindow. Cause:' + JSON.stringify(exception.code)+` message:${exception.message}`);
          expect(exception.code).assertEqual(1300002);
          done()
        }
    })

    /**
     * @tc.name   testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.number testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.desc   testDisableLandscapeMultiWindowPromiseErrCode1300002_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDisableLandscapeMultiWindowPromiseErrCode1300002_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
        let caseName = "testDisableLandscapeMultiWindowPromiseErrCode1300002_0100";
        let msgStr = 'jsunittest ' + caseName + ' ';
        
        try {

          console.log(msgStr + 'begin.');
          let subWin: window.Window = await windowStage!.createSubWindow('testDisableLandscapeMultiWindowPromise1')
          console.info(msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(subWin));
          await (subWin! as window.Window).destroyWindow();

          subWin.disableLandscapeMultiWindow().then(async () => {
            console.info(msgStr + 'Succeeded in calling disableLandscapeMultiWindow.');
            expect().assertFail();
            done()
          }).catch(async (err: Error) => {
            console.error(msgStr + 'Failed. Cause:' + JSON.stringify(err.code)+` message:${err.message}`);
            expect(err.code).assertEqual(1300002);
            expect(err.message!=null).assertTrue();
            done()
          });
        } catch (exception) {
          console.error(msgStr + 'Failed to set the call disableLandscapeMultiWindow. Cause:' +
          JSON.stringify(exception.code)+` message:${exception.message}`);
          expect(exception.code).assertEqual(1300002);
          done()
        }
      })


    })

}
