import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIExtensionContentSession, Want , UIExtensionAbility} from '@kit.AbilityKit';

import { window } from '@kit.ArkUI';

const DOMAIN = 0x0000;

export default class UIExtAbility  extends UIExtensionAbility {
  onCreate() {
    hilog.info(DOMAIN, 'testTag', `onCreate`);
  }

  onForeground() {
    hilog.info(DOMAIN, 'testTag', `onForeground`);
  }

  onBackground() {
    hilog.info(DOMAIN, 'testTag', `onBackground`);
  }

  onDestroy() {
    hilog.info(DOMAIN, 'testTag', `onDestroy`);
  }

  onSessionCreate(want: Want, session: UIExtensionContentSession) {
    const storage: LocalStorage = new LocalStorage();
    storage.setOrCreate('session', session);
    try {
      session.loadContent('uiextensionability/pages/UIExtensionAbilityPage', storage);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    }
    hilog.info(DOMAIN, 'testTag', `onSessionCreate done`);
    try {
      let appcontext = this.context.getApplicationContext();
      appcontext.getAllWindowStages()
        .then((data: Array<window.WindowStage>) => {
          hilog.info(0x0000, 'testTag', `[UIExtensionAbility onSessionCreate] getAllWindowStages size ${data.length}`);
          hilog.info(0x0000, 'testTag', '[UIExtensionAbility onSessionCreate] getAllWindowStages successfully. Data: ' + JSON.stringify(data));
        })
        .catch((e: Error) => {
          let err = e as BusinessError
          hilog.error(0x0000, 'testTag', `[UIExtensionAbility onSessionCreate] getAllWindowStages error. code: ${err.code}, message: ${err.message}`);
        });
    } catch (e) {
      let err = e as BusinessError;
      hilog.error(0x0000, 'testTag', `[UIExtensionAbility onSessionCreate] getAllWindowStages failed. code: ${err.code}, message: ${err.message}`);
    }
  }

  onSessionDestroy(session: UIExtensionContentSession) {
    session.terminateSelf().catch(() => {
      // handle error
    });
    hilog.info(DOMAIN, 'testTag', `onSessionDestroy`);
  }
}
