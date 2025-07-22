import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';
import { AppStorage } from '@ohos.arkui.stateManagement'

import common from '@ohos.app.ability.common';

let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext: common.UIAbilityContext;


class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag sjd EntryAbility', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent entering');
        MyCallback.runCasesOfCallback();
        if (err?.code) {
          hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'getAni windowStage = '+windowStage);
        hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent ok');
        try{
          AppStorage.setOrCreate<window.WindowStage>('windowStage',windowStage,Type.from<window.WindowStage>());
          let mainWindow = windowStage.getMainWindowSync();

          AppStorage.setOrCreate<window.Window>('mainWindow',mainWindow,Type.from<window.Window>());
          hilog.info(0x0000, 'testTag sjd EntryAbility', 'getAni windowStage = '+JSON.stringify(windowStage) + ' mainWindow' +JSON.stringify(mainWindow));
          AppStorage.setOrCreate('context', this.context,Type.from<common.UIAbilityContext>());
        }catch(e: Error){
          hilog.info(0x0000, 'testTag sjd EntryAbility', 'getAni'+e.message);
        }
      });
    } catch (e: Error) {
      hilog.info(0x0000, 'testTag sjd EntryAbility', 'loadContent catch error：-----------' + e.message);
    }

  }

  onDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onDestroy');
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag sjd EntryAbility', '%{public}s', 'TestAbility onBackground');
  }
}