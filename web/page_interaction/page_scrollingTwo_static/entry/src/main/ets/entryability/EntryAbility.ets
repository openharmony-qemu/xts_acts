import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { MyCallback } from '../models/MyCallback';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag EntryAbility', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    try {
      windowStage.loadContent('pages/WebScrollbarLayoutPolicy', (err: BusinessError<void> | null): void => {
        MyCallback.runCasesOfCallback();
        if (err?.code) {
          return;
        }
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag EntryAbility', 'loadContent error');
    }
  }

  onDestroy(): Promise<void> | undefined {
    return undefined;
  }
}
