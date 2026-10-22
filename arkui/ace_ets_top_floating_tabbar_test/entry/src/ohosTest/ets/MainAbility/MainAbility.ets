import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base';

const TAG: string = '[TopFloatingTabBarTest]';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log(`${TAG} MainAbility onCreate`);
  }

  onDestroy(): void {
    console.log(`${TAG} MainAbility onDestroy`);
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    console.log(`${TAG} MainAbility onWindowStageCreate`);
    windowStage.loadContent('MainAbility/pages/TopFloatingBarIndex', (err) => {
      if (err.code) {
        console.error(`${TAG} Failed to load content. Cause: ` + JSON.stringify(err));
        return;
      }
      console.info(`${TAG} Succeeded in loading content.`);
    });
    let windowClass: window.Window | undefined = undefined;
    windowStage.getMainWindow((err: BusinessError, data: window.Window) => {
      let errCode: number = err.code;
      if (errCode) {
        console.error(`${TAG} Failed to obtain the main window. Cause: ` + JSON.stringify(err));
        return;
      }
      windowClass = data;
      hilog.info(0x0000, 'testTag', 'Succeeded in obtaining the main window.');
      try {
        let properties: window.WindowProperties = windowClass.getWindowProperties();
        let wRect: window.Rect = properties.windowRect;
        console.info(`${TAG} windowRect left:${wRect.left} top:${wRect.top}`);
      } catch (exception) {
        hilog.error(0x0000, 'testTag', 'Failed to obtain the window properties. Cause: ' + JSON.stringify(exception));
      }
    });
  }

  onWindowStageDestroy(): void {
    console.log(`${TAG} MainAbility onWindowStageDestroy`);
  }

  onForeground(): void {
    console.log(`${TAG} MainAbility onForeground`);
  }

  onBackground(): void {
    console.log(`${TAG} MainAbility onBackground`);
  }
}
