/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct setOverlayManagerOptionsReturn {
  @State str: string = 'hello'
  @State RootOverlay: boolean = true;

  build() {
    Column({ space: 5 }) {
      Text(this.str).id('text').height(40)
      Button('SetRenderRootOverlay')
        .id('setOverlayManagerOptionsReturnBoolean')
        .height(40)
        .width(130)
        .onClick(() => {
          let res: boolean = this.getUIContext().setOverlayManagerOptions
          ({
            RootOverlay: this.RootOverlay
          })
          AppStorage.SetOrCreate('setOverlayManagerOptionsReturnBoolean', res)
          this.str = JSON.stringify(res)
        })
    }
    .width('100%')
  }
}