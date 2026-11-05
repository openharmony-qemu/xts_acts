/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { Want } from '@kit.AbilityKit';

@Entry
@Component
struct FormEditStatic {
  private action: string = '';
  private color: string = '';
  private useNull: boolean = false;
  private useUndefined: boolean = false;
  private needLoadContent: boolean = false;

  aboutToAppear() {
    let want = AppStorage.get<Want>('want') as Want;
    console.info('FormEditStatic aboutToAppear want: ' + JSON.stringify(want));
    if (want?.parameters) {
      this.action = want.parameters['formEditAction'] as string;
      this.color = want.parameters['color'] as string;
      this.useNull = want.parameters['useNull'] as boolean;
      this.useUndefined = want.parameters['useUndefined'] as boolean;
      this.needLoadContent = want.parameters['needLoadContent'] as boolean;
    }
    console.info('FormEditStatic aboutToAppear action: ' + this.action + ', color: ' + this.color);
  }

  build() {
    Row() {
      Column() {
        UIExtensionComponent({
          bundleName: 'com.example.actsformtest.static',
          abilityName: 'FormEditExtAbility',
          parameters: {
            'ability.want.params.uiExtensionType': 'formEdit',
            'formEditAction': this.action,
            'color': this.color,
            'useNull': this.useNull,
            'useUndefined': this.useUndefined,
            'needLoadContent': this.needLoadContent,
          }
        })
          .size({ width: 300, height: 300 })
      }
      .width('100%')
    }
    .height('100%')
  }
}
