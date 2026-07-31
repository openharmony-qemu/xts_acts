/**
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

import events_emitter from '@ohos.events.emitter';

@Entry
@Component
struct AccessibilityRolePage {
  @State accessibilityRoleValue: SecurityComponentRoleType | undefined = undefined

  private stateChangeCallBack = (eventData:events_emitter.EventData) => {
    if (eventData != null && eventData.data != undefined) {
      console.debug('====>accessibilityRole page state change called:' + JSON.stringify(eventData));
      if (eventData.data.accessibilityRole != null) {
        this.accessibilityRoleValue = eventData.data.accessibilityRole;
      }
    }
  }

  onPageShow() {
    console.debug('====>page_accessibilityRole page show called');
    let stateChangeEvent:events_emitter.InnerEvent = {
      eventId: 1,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(stateChangeEvent, this.stateChangeCallBack);
  }

  onPageHide() {
    console.debug('====>page_accessibilityRole page hide called');
    events_emitter.off(1);
  }

  build() {
    Row() {
      Column() {
        SaveButton({ icon: SaveIconStyle.FULL_FILLED, text: SaveDescription.DOWNLOAD, buttonType: ButtonType.Normal })
          .onClick((event: ClickEvent, result: SaveButtonOnClickResult) => {
            try {
              let clickData:events_emitter.EventData = {
                data: {
                  'clickResult': result,
                }
              }
              let clickEvent:events_emitter.InnerEvent = {
                eventId: 2,
                priority: events_emitter.EventPriority.LOW
              }
              console.debug('====>page_accessibilityRole onclick result:' + JSON.stringify(result))
              events_emitter.emit(clickEvent, clickData)
            } catch (err) {
              console.debug('====>page_accessibilityRole emit action state err: ' + JSON.stringify(err.message))
            }
          })
          .accessibilityRole(this.accessibilityRoleValue)
          .id('keyAccessibilityRole')
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}