'use static';
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
import { Entry, Component, Column, Text, List, ListItem, Divider, Button, DialogDisplayMode, FocusWrapMode, EventQueryType, CompetitionStrategy, SystemProperties } from '@ohos.arkui.component';
import { AppStorage, State } from '@ohos.arkui.stateManagement';
import { Router } from '@ohos.arkui.UIContext';

@Entry
@Component
struct EnumsIndex {
  @State enumInfo: string = '';

  aboutToAppear() {
    try {
      let routerInstance = this.getUIContext().getRouter();
      AppStorage.setOrCreate<Router>('router', routerInstance);
    } catch (error) { console.info('[ARKUI_NEW] EnumsIndex error ' + error); }

    this.enumInfo = 'DDM_SCREEN=' + DialogDisplayMode.SCREEN_BASED +
      ',DDM_WINDOW=' + DialogDisplayMode.WINDOW_BASED +
      ',FWM_DEFAULT=' + FocusWrapMode.DEFAULT +
      ',FWM_WRAP=' + FocusWrapMode.WRAP_WITH_ARROW +
      ',EQT_CLICK=' + EventQueryType.ON_CLICK +
      ',CS_DEFAULT=' + CompetitionStrategy.DEFAULT +
      ',CS_COMP=' + CompetitionStrategy.COMPETITION;

    AppStorage.setOrCreate<string>('enumValues', this.enumInfo);
  }

  build() {
    Column() {
      Text('Enums Test Page').key('enumsRoot').id('enumsRoot').fontSize(20)
      Text(this.enumInfo).key('enumsInfo').id('enumsInfo').fontSize(12).maxLines(5)

      Divider().key('enumsDivider').id('enumsDivider').width('100%')

      List() {
        ListItem() { Text('DialogDisplayMode.SCREEN_BASED = ' + DialogDisplayMode.SCREEN_BASED).fontSize(14) }
        ListItem() { Text('DialogDisplayMode.WINDOW_BASED = ' + DialogDisplayMode.WINDOW_BASED).fontSize(14) }
        ListItem() { Text('FocusWrapMode.DEFAULT = ' + FocusWrapMode.DEFAULT).fontSize(14) }
        ListItem() { Text('FocusWrapMode.WRAP_WITH_ARROW = ' + FocusWrapMode.WRAP_WITH_ARROW).fontSize(14) }
        ListItem() { Text('CompetitionStrategy.DEFAULT = ' + CompetitionStrategy.DEFAULT).fontSize(14) }
        ListItem() { Text('CompetitionStrategy.COMPETITION = ' + CompetitionStrategy.COMPETITION).fontSize(14) }
        ListItem() { Text('SystemProperties.BREAK_POINT = ' + SystemProperties.BREAK_POINT).fontSize(14) }
      }.key('enumsList').id('enumsList').width('100%').height('60%')
    }.width('100%').height('100%').padding(16)
  }
}
