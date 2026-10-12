'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  Entry,
  Component,
  Column,
  ColumnOptions,
  Button,
  Text
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router, UIContext, PromptAction } from '@ohos.arkui.UIContext';
import promptAction from '@ohos.promptAction';

@Entry
@Component
struct PromptActionButtonsIndex {
  private static readonly RESULT_KEY: string = 'promptActionButtonsResult';

  @State resultStatus: string = 'init';

  aboutToAppear() {
    try {
      const router: Router = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', router);
      AppStorage.setOrCreate<string>(PromptActionButtonsIndex.RESULT_KEY, 'init');
    } catch (error) {
      console.error('PromptActionButtonsIndex aboutToAppear error: ' + error);
    }
  }

  private setResult(status: string): void {
    this.resultStatus = status;
    AppStorage.setOrCreate<string>(PromptActionButtonsIndex.RESULT_KEY, status);
    AppStorage.set<string>(PromptActionButtonsIndex.RESULT_KEY, status);
  }

  private showActionMenuTripleButtons(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Triple Buttons Menu',
        buttons: [
          { text: 'Button1', color: '#666666' },
          { text: 'Button2', color: '#666666' },
          { text: 'Button3', color: '#666666' }
        ] as promptAction.PromptActionTripleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_triple_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_triple_fail');
        console.error('showActionMenu triple error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_triple_fail');
      console.error('showActionMenu triple exception: ' + error);
    }
  }

  private showActionMenuQuadrupleButtons(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Quadruple Buttons Menu',
        buttons: [
          { text: 'Button1', color: '#666666' },
          { text: 'Button2', color: '#666666' },
          { text: 'Button3', color: '#666666' },
          { text: 'Button4', color: '#666666' }
        ] as promptAction.PromptActionQuadrupleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_quadruple_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_quadruple_fail');
        console.error('showActionMenu quadruple error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_quadruple_fail');
      console.error('showActionMenu quadruple exception: ' + error);
    }
  }

  private showActionMenuQuintupleButtons(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Quintuple Buttons Menu',
        buttons: [
          { text: 'Button1', color: '#666666' },
          { text: 'Button2', color: '#666666' },
          { text: 'Button3', color: '#666666' },
          { text: 'Button4', color: '#666666' },
          { text: 'Button5', color: '#666666' }
        ] as promptAction.PromptActionQuintupleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_quintuple_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_quintuple_fail');
        console.error('showActionMenu quintuple error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_quintuple_fail');
      console.error('showActionMenu quintuple exception: ' + error);
    }
  }

  private showActionMenuSextupleButtons(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Sextuple Buttons Menu',
        buttons: [
          { text: 'Button1', color: '#666666' },
          { text: 'Button2', color: '#666666' },
          { text: 'Button3', color: '#666666' },
          { text: 'Button4', color: '#666666' },
          { text: 'Button5', color: '#666666' },
          { text: 'Button6', color: '#666666' }
        ] as promptAction.PromptActionSextupleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_sextuple_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_sextuple_fail');
        console.error('showActionMenu sextuple error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_sextuple_fail');
      console.error('showActionMenu sextuple exception: ' + error);
    }
  }

  private showActionMenuTripleWithUndefined(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Triple Buttons With Undefined',
        buttons: [
          { text: 'Button1', color: '#666666' },
          undefined,
          undefined
        ] as promptAction.PromptActionTripleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_tripleUndefined_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_tripleUndefined_fail');
        console.error('showActionMenu tripleUndefined error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_tripleUndefined_fail');
      console.error('showActionMenu tripleUndefined exception: ' + error);
    }
  }

  private showActionMenuSextupleWithPrimary(): void {
    try {
      const prompt: PromptAction = this.getUIContext().getPromptAction();
      const options: promptAction.ActionMenuOptions = {
        title: 'Sextuple Buttons With Primary',
        buttons: [
          { text: 'Button1', color: '#666666', primary: true },
          { text: 'Button2', color: '#666666' },
          { text: 'Button3', color: '#666666' },
          { text: 'Button4', color: '#666666' },
          { text: 'Button5', color: '#666666' },
          { text: 'Button6', color: '#666666' }
        ] as promptAction.PromptActionSextupleButtons
      };
      prompt.showActionMenu(options).then((response: promptAction.ActionMenuSuccessResponse) => {
        this.setResult('showActionMenu_sextuplePrimary_ok_' + response.index);
      }).catch((err: Error) => {
        this.setResult('showActionMenu_sextuplePrimary_fail');
        console.error('showActionMenu sextuplePrimary error: ' + err);
      });
    } catch (error) {
      this.setResult('showActionMenu_sextuplePrimary_fail');
      console.error('showActionMenu sextuplePrimary exception: ' + error);
    }
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Text('PromptActionButtons Test')
        .id('pab_title')
        .fontSize(20)
        .margin(10)

      Button('showActionMenu TripleButtons')
        .id('pab_triple')
        .height('4%')
        .onClick(() => {
          this.showActionMenuTripleButtons();
        })
      Text(this.resultStatus).key('pab_tripleStatus').height('3%')

      Button('showActionMenu QuadrupleButtons')
        .id('pab_quadruple')
        .height('4%')
        .onClick(() => {
          this.showActionMenuQuadrupleButtons();
        })
      Text(this.resultStatus).key('pab_quadrupleStatus').height('3%')

      Button('showActionMenu QuintupleButtons')
        .id('pab_quintuple')
        .height('4%')
        .onClick(() => {
          this.showActionMenuQuintupleButtons();
        })
      Text(this.resultStatus).key('pab_quintupleStatus').height('3%')

      Button('showActionMenu SextupleButtons')
        .id('pab_sextuple')
        .height('4%')
        .onClick(() => {
          this.showActionMenuSextupleButtons();
        })
      Text(this.resultStatus).key('pab_sextupleStatus').height('3%')

      Button('showActionMenu TripleButtons with undefined')
        .id('pab_tripleUndefined')
        .height('4%')
        .onClick(() => {
          this.showActionMenuTripleWithUndefined();
        })
      Text(this.resultStatus).key('pab_tripleUndefinedStatus').height('3%')

      Button('showActionMenu SextupleButtons with primary')
        .id('pab_sextuplePrimary')
        .height('4%')
        .onClick(() => {
          this.showActionMenuSextupleWithPrimary();
        })
      Text(this.resultStatus).key('pab_sextuplePrimaryStatus').height('3%')
    }
    .width('100%')
    .height('100%');
  }
}