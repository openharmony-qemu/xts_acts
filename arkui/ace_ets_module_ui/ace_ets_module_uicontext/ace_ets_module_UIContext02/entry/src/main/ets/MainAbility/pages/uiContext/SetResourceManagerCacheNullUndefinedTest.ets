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
import { UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct SetResourceManagerCacheMaxCountForHSPNullUndefinedTest {
  @State message: string = 'start'

  build() {
    Column({ space: 8 }) {
      Button('setResourceManagerCache_null_undef')
        .id('setResourceManagerCache_null_id')
        .onClick(() => {
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(null);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_null', 'success');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_null', 'error');
          }
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(undefined);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_undefined', 'success');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_undefined', 'error');
          }
        })

      Button('setResourceManagerCache_normal_return')
        .id('setResourceManagerCache_normal_id')
        .onClick(() => {
          try {
            // void 返回：调用不抛即视为返回值维度覆盖
            UIContext.setResourceManagerCacheMaxCountForHSP(16);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_normal', 'void_ok');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_normal',
              String((e as BusinessError).code));
          }
        })

      Button('setResourceManagerCache_error_codes')
        .id('setResourceManagerCache_error_id')
        .onClick(() => {
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(-1);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_neg', 'no_throw');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_neg',
              Number((e as BusinessError).code));
          }
          try {
            UIContext.setResourceManagerCacheMaxCountForHSP(1.5);
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_float', 'no_throw');
          } catch (e) {
            AppStorage.setOrCreate('setResourceManagerCacheMaxCountForHSP_float',
              Number((e as BusinessError).code));
          }
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
