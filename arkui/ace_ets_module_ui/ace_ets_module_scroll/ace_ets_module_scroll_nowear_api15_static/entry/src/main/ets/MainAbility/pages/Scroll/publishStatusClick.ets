// import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { BusinessError } from '@ohos.base';
import commonEventManager from '@ohos.commonEventManager'
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { Component, ClickEvent, Button, Column } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'

@Component
export struct StatusClickComponent {
  public isLandScape: boolean = false;

  private changeOrientation(isLandscape: boolean) {
    // let context = getContext(this) as common.UIAbilityContext;
    // window.getLastWindow(context).then((lastWindow) => {
    //   lastWindow.setPreferredOrientation(isLandscape ? window.Orientation.LANDSCAPE : window.Orientation.PORTRAIT)
    // });
  }
  build() {
    Column() {
      Button('Top').onClick((e:ClickEvent) => {
        // 发布公共事件
        try {
          commonEventManager.publish('usual.event.CLICK_STATUSBAR', (err: BusinessError | null) => {
            console.log('Publish statusBar click');
            if (err) {
              console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
            } else {
              console.info('publish success');
            }
          });
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.error(`publish failed, code is ${err.code}, message is ${err.message}`);
        }
      }).width(100).height(40).margin(5).id('Top')
    }
  }
}