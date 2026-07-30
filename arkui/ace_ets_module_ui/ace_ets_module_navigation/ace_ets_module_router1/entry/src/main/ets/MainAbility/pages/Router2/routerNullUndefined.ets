/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterApiNullUndefined {
  @State message: string = 'Router API 测试页面';

  build() {
    Column() {
      Text('Router API Null/Undefined 测试')

      // 测试 recoverable 参数的 true/false 值
      Row(){
        Button('push - recoverable: true')
          .width('50%')
          .onClick(async () => {
            try {
              await router.push({
                url: 'MainAbility/pages/Router2/RouterTargetPage',
                params: { recoverable: true }
              });
              console.info('push with recoverable true success');
            } catch (err) {
              console.error('push with recoverable true failed: ' + JSON.stringify(err));
            }
          })
          .id('button_push_recoverable_true')

        Button('push - recoverable: false')
          .width('50%')
          .onClick(async () => {
            try {
              await router.push({
                url: 'MainAbility/pages/Router2/RouterTargetPage',
                params: { recoverable: false }
              });
              console.info('push with recoverable false success');
            } catch (err) {
              console.error('push with recoverable false failed: ' + JSON.stringify(err));
            }
          })
          .id('button_push_recoverable_false')
      }
      .height('20%')

      Row(){
        Button('push - params: null')
          .width('50%')
          .onClick(async () => {
            try {
              await router.push({
                url: 'MainAbility/pages/Router2/RouterTargetPage',
                params: null
              });
              console.info('push with params null success');
            } catch (err) {
              console.error('push with params null failed: ' + JSON.stringify(err));
            }
          })
          .id('button_push_params_null')

        Button('push - params: undefined')
          .width('50%')
          .onClick(async () => {
            try {
              await router.push({
                url: 'MainAbility/pages/Router2/RouterTargetPage',
                params: undefined
              });
              console.info('push with params undefined success');
            } catch (err) {
              console.error('push with params undefined failed: ' + JSON.stringify(err));
            }
          })
          .id('button_push_params_undefined')
      }
      .height('20%')

      Row(){
        // 测试 pushUrl 的 uri 空值
        Button('pushUrl - uri: empty string')
          .width('30%')
          .onClick(async () => {
            try {
              await router.pushUrl({
                url: ''
              });
              console.info('pushUrl with empty uri success');
            } catch (err) {
              console.error('pushUrl with empty uri failed: ' + JSON.stringify(err));
              this.message = 'pushUrl empty uri error: ' + (err as ESObject).message;
            }
          })
          .id('button_pushUrl_uri_empty')

        Button('pushUrl - options: null')
          .width('30%')
          .onClick(async () => {
            try {
              await router.pushUrl(null as ESObject);
              console.info('pushUrl with null options success');
            } catch (err) {
              console.error('pushUrl with null options failed: ' + JSON.stringify(err));
              this.message = 'pushUrl null options error: ' + (err as ESObject).message;
            }
          })
          .id('button_pushUrl_options_null')

        Button('pushUrl - options: undefined')
          .width('30%')
          .onClick(async () => {
            try {
              await router.pushUrl(undefined as ESObject);
              console.info('pushUrl with undefined options success');
            } catch (err) {
              console.error('pushUrl with undefined options failed: ' + JSON.stringify(err));
              this.message = 'pushUrl undefined options error: ' + (err as ESObject).message;
            }
          })
          .id('button_pushUrl_options_undefined')
      }
      .height('20%')

      Row(){
        // 测试 back 方法的 recoverable 和 uri
        Button('back - recoverable: true')
          .width('30%')
          .onClick(() => {
            router.back({
              url: 'MainAbility/pages/Router2/RouterTargetPage',
              params: { recoverable: true }
            });
          })
          .id('button_back_recoverable_true')

        Button('back - recoverable: false')
          .width('30%')
          .onClick(() => {
            router.back({
              url: 'MainAbility/pages/Router2/RouterTargetPage',
              params: { recoverable: false }
            });
          })
          .id('button_back_recoverable_false')

        Button('back - uri: empty string')
          .width('30%')
          .onClick(() => {
            router.back({
              url: ''
            });
          })
          .id('button_back_uri_empty')
      }
      .height('20%')

      Text(this.message)
        .id('text_result_message')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}