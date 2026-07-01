'use static';
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';

class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    hilog.info(0x0000, 'testTag', 'EntryAbility onWindowStageCreate');
    try {
      windowStage.loadContent('pages/Index', (err: BusinessError<void> | null): void => {
        if (err?.code) {
          hilog.info(0x0000, 'testTag', 'loadContent error');
          return;
        }
        hilog.info(0x0000, 'testTag', 'loadContent ok');
      });
    } catch (e) {
      hilog.info(0x0000, 'testTag', 'loadContent catch error: ' + e.message);
    }
  }

  onDestroy(): Promise<void> | undefined {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onDestroy');
    return undefined;
  }

  onWindowStageDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onWindowStageDestroy');
  }

  onForeground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onForeground');
  }

  onBackground() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'EntryAbility onBackground');
  }
}
