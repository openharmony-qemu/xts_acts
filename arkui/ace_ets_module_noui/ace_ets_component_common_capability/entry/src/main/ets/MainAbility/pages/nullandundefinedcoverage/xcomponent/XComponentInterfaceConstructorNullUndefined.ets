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

@Entry
@Component
struct XComponentInterfaceConstructorNullUndefinedTest {
  private xComponentController: XComponentController = new XComponentController();

  build() {
    Row() {
      Column() {
        // ========== (options: XComponentOptions) constructor tests (since 12) ==========

        // Test XComponentInterface constructor with null options (since 12)
        XComponent(null as XComponentOptions)
          .id('xcomponent_options_null')
          .width('100%')
          .height('5%')

        // Test XComponentInterface constructor with undefined options (since 12)
        XComponent(undefined as XComponentOptions)
          .id('xcomponent_options_undefined')
          .width('100%')
          .height('5%')

        // Test XComponentInterface constructor with valid XComponentOptions (since 12)
        XComponent({ type: XComponentType.TEXTURE, controller: this.xComponentController } as XComponentOptions)
          .id('xcomponent_options_valid')
          .width('100%')
          .height('5%')

        // ========== (params: NativeXComponentParameters) constructor tests (since 19) ==========

        // Test XComponentInterface constructor with null params (since 19)
        XComponent(null as NativeXComponentParameters)
          .id('xcomponent_params_null')
          .width('100%')
          .height('5%')

        // Test XComponentInterface constructor with undefined params (since 19)
        XComponent(undefined as NativeXComponentParameters)
          .id('xcomponent_params_undefined')
          .width('100%')
          .height('5%')

        // Test XComponentInterface constructor with valid NativeXComponentParameters (since 19)
        XComponent({ type: XComponentType.TEXTURE } as NativeXComponentParameters)
          .id('xcomponent_params_valid')
          .width('100%')
          .height('5%')
      }
      .width('100%')
    }
    .height('100%')
  }
}
