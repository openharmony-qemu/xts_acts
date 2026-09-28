'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
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
  Text,
  Button,
  Menu,
  Builder
} from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';
import { AddFormMenuItem, AddFormOptions } from '@ohos.arkui.advanced.FormMenu';
import Want from '@ohos.app.ability.Want';
import formBindingData from '@ohos.app.form.formBindingData';
import { BusinessError } from '@ohos.base';

@Entry
@Component
struct AddFormMenuItemPage {
  @State readyText: string = 'init';
  private formWant: Want = {
    bundleName: 'com.arkui.ace.richeditor.static',
    abilityName: 'EntryFormAbility',
    parameters: {
      'ohos.extra.param.key.form_dimension': 2,
      'ohos.extra.param.key.form_name': 'widget',
      'ohos.extra.param.key.module_name': 'entry'
    }
  };
  private formOptions: AddFormOptions = {
    formBindingData: formBindingData.createFormBindingData({}),
    callback: (err: BusinessError | null, formId: string | undefined): void => {
      AppStorage.setOrCreate('formMenu_callback_code', String(err?.code ?? 0));
      AppStorage.setOrCreate('formMenu_callback_id', formId ?? 'none');
    },
    style: {
      options: {
        content: 'AddToDesktop'
      }
    }
  };

  aboutToAppear(): void {
    try {
      AppStorage.setOrCreate<Router>('router', this.getUIContext().getRouter());
      AppStorage.setOrCreate('formMenu_page_ready', 'ready');
      this.readyText = 'ready';
    } catch (error) {
      AppStorage.setOrCreate('formMenu_page_ready', 'failed');
      this.readyText = 'failed';
      console.log('AddFormMenuItemPage error ' + error);
    }
  }

  @Builder
  menuWithOptions(): void {
    Menu() {
      AddFormMenuItem(this.formWant, 'form_menu_comp_opts', this.formOptions)
    }
  }

  @Builder
  menuUndefinedOptions(): void {
    Menu() {
      AddFormMenuItem(this.formWant, 'form_menu_comp_undef', undefined)
    }
  }

  build() {
    Column() {
      Text('AddFormMenuItem')
        .id('formMenu_title')
        .fontSize(18)
      Text(this.readyText)
        .id('formMenu_ready_text')
        .fontSize(14)
      Button('WithOptions')
        .id('btn_formMenu_with_options')
        .width('80%')
        .bindMenu(this.menuWithOptions)
      Button('UndefinedOptions')
        .id('btn_formMenu_undefined_options')
        .width('80%')
        .bindMenu(this.menuUndefinedOptions)
      Button('MarkBuilt')
        .id('btn_formMenu_mark_built')
        .width('80%')
        .onClick((): void => {
          AppStorage.setOrCreate('formMenu_built', 'ok');
        })
    }
    .width('100%')
    .height('100%')
  }
}
