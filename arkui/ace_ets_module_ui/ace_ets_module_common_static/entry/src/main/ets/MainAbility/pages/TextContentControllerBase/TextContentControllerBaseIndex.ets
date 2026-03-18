'use static';
import { Entry, Component, Column, Button, Text, StyledString, TextRange, TextInput, TextInputController } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextContentControllerBaseIndex {
  @State setStyledPlaceholderStatus: string = 'init';
  @State deleteBackwardStatus: string = 'init';
  @State scrollToVisibleStatus: string = 'init';
  private controller: TextInputController = new TextInputController();

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('TextContentControllerBaseIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      TextInput({
        placeholder: 'text_content_controller',
        controller: this.controller
      })
        .id('textContentControllerInput');

      Button('setStyledPlaceholder')
        .id('textContentSetStyledPlaceholderBtn')
        .onClick(() => {
          try {
            this.controller.setStyledPlaceholder(new StyledString('placeholder'));
            this.setStyledPlaceholderStatus = 'setStyledPlaceholder_ok';
          } catch (error) {
            this.setStyledPlaceholderStatus = 'setStyledPlaceholder_fail';
          }
        });
      Text(this.setStyledPlaceholderStatus).key('textContentSetStyledPlaceholderStatus');

      Button('deleteBackward')
        .id('textContentDeleteBackwardBtn')
        .onClick(() => {
          try {
            this.controller.deleteBackward();
            this.deleteBackwardStatus = 'deleteBackward_ok';
          } catch (error) {
            this.deleteBackwardStatus = 'deleteBackward_fail';
          }
        });
      Text(this.deleteBackwardStatus).key('textContentDeleteBackwardStatus');

      Button('scrollToVisible')
        .id('textContentScrollToVisibleBtn')
        .onClick(() => {
          try {
            this.controller.scrollToVisible({ start: 0, end: 1 } as TextRange);
            this.scrollToVisibleStatus = 'scrollToVisible_ok';
          } catch (error) {
            this.scrollToVisibleStatus = 'scrollToVisible_fail';
          }
        });
      Text(this.scrollToVisibleStatus).key('textContentScrollToVisibleStatus');
    }
    .width('100%')
    .height('100%');
  }
}
