'use static';
import { Entry, Component, Column, Button, Text, DrawModifier, DrawContext } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

class DemoDrawModifier extends DrawModifier {
  drawOverlay(drawContext: DrawContext): void {
    let context = drawContext;
    if (context === undefined) {
      return;
    }
  }
}

@Entry
@Component
struct DrawModifierIndex {
  @State drawOverlayStatus: string = 'init';

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('DrawModifierIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('drawOverlay')
        .id('drawModifierOverlayBtn')
        .onClick(() => {
          try {
            let modifier = new DemoDrawModifier();
            modifier.drawOverlay({} as DrawContext);
            this.drawOverlayStatus = 'drawOverlay_ok';
          } catch (error) {
            this.drawOverlayStatus = 'drawOverlay_fail';
          }
        });
      Text(this.drawOverlayStatus).key('drawModifierOverlayStatus');
    }
    .width('100%')
    .height('100%');
  }
}
