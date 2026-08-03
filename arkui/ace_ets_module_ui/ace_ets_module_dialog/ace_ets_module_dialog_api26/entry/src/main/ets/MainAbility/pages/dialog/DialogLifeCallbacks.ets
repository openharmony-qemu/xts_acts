/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { DialogPresenter } from '@ohos.arkui.UIContext';
import { DialogDismissal } from '@ohos.arkui.dialog';

@Entry
@Component
struct DialogLifeCallbacks {
  @State lastAction: string = 'none';
  @State lifeLog: string = '';

  private presenter(): DialogPresenter {
    return this.getUIContext().getDialogPresenter();
  }

  private append(tag: string): void {
    this.lifeLog = this.lifeLog + tag + ';';
  }

  build() {
    Scroll() {
      Column({ space: 8 }) {
        Text('DialogBaseOptions lifecycle callbacks').fontSize(18).fontWeight(FontWeight.Bold)
        Text('action=' + this.lastAction).id('life_cb_action')
        Text('life=' + this.lifeLog).id('life_cb_log')
        Button('onWillAppear')
          .id('btn_life_will_appear')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'WillAppearTitle',
              message: { content: 'WillAppearMsg' },
              onWillAppear: () => {
                this.append('willAppear');
                this.lastAction = 'willAppear';
              },
              buttons: [{
                value: 'WillAppearOK',
                action: () => { this.lastAction = 'WillAppearOK'; }
              }]
            });
          })
        Button('onDidAppear')
          .id('btn_life_did_appear')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'DidAppearTitle',
              message: { content: 'DidAppearMsg' },
              onDidAppear: () => {
                this.append('didAppear');
                this.lastAction = 'didAppear';
              },
              buttons: [{
                value: 'DidAppearOK',
                action: () => { this.lastAction = 'DidAppearOK'; }
              }]
            });
          })
        Button('onWillDisappear')
          .id('btn_life_will_disappear')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'WillDisappearTitle',
              message: { content: 'WillDisappearMsg' },
              onWillDisappear: () => {
                this.append('willDisappear');
                this.lastAction = 'willDisappear';
              },
              buttons: [{
                value: 'WillDisappearOK',
                action: () => { this.lastAction = 'WillDisappearOK'; }
              }]
            });
          })
        Button('onDidDisappear')
          .id('btn_life_did_disappear')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'DidDisappearTitle',
              message: { content: 'DidDisappearMsg' },
              onDidDisappear: () => {
                this.append('didDisappear');
                this.lastAction = 'didDisappear';
              },
              buttons: [{
                value: 'DidDisappearOK',
                action: () => { this.lastAction = 'DidDisappearOK'; }
              }]
            });
          })
        Button('full life chain')
          .id('btn_life_full')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'FullLifeTitle',
              message: { content: 'FullLifeMsg' },
              onWillAppear: () => { this.append('W'); },
              onDidAppear: () => { this.append('D'); },
              onWillDisappear: () => { this.append('w'); },
              onDidDisappear: () => {
                this.append('d');
                this.lastAction = 'fullLife';
              },
              buttons: [{
                value: 'FullLifeOK',
                action: () => { this.lastAction = 'FullLifeOK'; }
              }]
            });
          })
        Button('onWillDismiss reason')
          .id('btn_life_will_dismiss')
          .onClick(async () => {
            this.lifeLog = '';
            await this.presenter().present({
              title: 'DismissLifeTitle',
              message: { content: 'DismissLifeMsg' },
              autoCancel: true,
              onWillDismiss: (dismissal: DialogDismissal) => {
                this.lifeLog = 'reason=' + String(dismissal.reason);
                this.lastAction = 'dismissCb';
                dismissal.dismiss();
              },
              buttons: [{
                value: 'DismissLifeOK',
                action: () => { this.lastAction = 'DismissLifeOK'; }
              }]
            });
          })
        Button('subtitle only style')
          .id('btn_life_subtitle')
          .onClick(async () => {
            await this.presenter().present({
              title: 'SubOnlyTitle',
              subtitle: 'OnlySubtitle',
              message: { content: 'SubOnlyMsg' },
              buttons: [{
                value: 'SubOnlyOK',
                action: () => { this.lastAction = 'SubOnlyOK'; }
              }]
            });
          })
        Button('title subtitle message')
          .id('btn_life_tsm')
          .onClick(async () => {
            await this.presenter().present({
              title: 'TSMTitle',
              subtitle: 'TSMSub',
              message: { content: 'TSMMsg', wordBreak: WordBreak.BREAK_ALL },
              buttons: [{
                value: 'TSMOK',
                action: () => { this.lastAction = 'TSMOK'; }
              }]
            });
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
