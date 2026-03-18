'use static';
import { Entry, Component, Column, Button, Text, TransitionEffect } from '@ohos.arkui.component';
import { FrameNode } from '@ohos.arkui.node';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TransitionEffectIndex {
  @State identityStatus: string = 'init';
  @State slideStatus: string = 'init';
  @State slideSwitchStatus: string = 'init';

  private hasComponentInfo(): boolean {
    try {
      let rootNode: FrameNode | null = this.getUIContext().getFrameNodeByUniqueId(this.getUniqueId());
      let firstChildNode: FrameNode | null = rootNode?.getFirstChild() ?? null;
      return firstChildNode !== null;
    } catch (error) {
      return false;
    }
  }

  aboutToAppear() {
    try {
      let router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
    } catch (error) {
      console.error('TransitionEffectIndex aboutToAppear error: ' + error);
    }
  }

  build() {
    Column() {
      Button('IDENTITY').id('transitionIdentityBtn').onClick(() => {
        try {
          let identity: TransitionEffect = TransitionEffect.IDENTITY;
          this.identityStatus = this.hasComponentInfo() && identity !== undefined ? 'identity_ok' : 'identity_fail';
        } catch (error) {
          this.identityStatus = 'identity_fail';
        }
      });
      Text(this.identityStatus).key('transitionIdentityStatus');

      Button('SLIDE').id('transitionSlideBtn').onClick(() => {
        try {
          let slide: TransitionEffect = TransitionEffect.SLIDE;
          this.slideStatus = this.hasComponentInfo() && slide !== undefined ? 'slide_ok' : 'slide_fail';
        } catch (error) {
          this.slideStatus = 'slide_fail';
        }
      });
      Text(this.slideStatus).key('transitionSlideStatus');

      Button('SLIDE_SWITCH').id('transitionSlideSwitchBtn').onClick(() => {
        try {
          let slideSwitch: TransitionEffect = TransitionEffect.SLIDE_SWITCH;
          this.slideSwitchStatus = this.hasComponentInfo() && slideSwitch !== undefined ? 'slideSwitch_ok' : 'slideSwitch_fail';
        } catch (error) {
          this.slideSwitchStatus = 'slideSwitch_fail';
        }
      });
      Text(this.slideSwitchStatus).key('transitionSlideSwitchStatus');
    }
    .width('100%')
    .height('100%');
  }
}
