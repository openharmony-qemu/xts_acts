/*
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libautoeffecttest.so';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  @StorageLink('xComponentReady') xComponentReady: boolean = false;
  @StorageLink('xComponentReady2') xComponentReady2: boolean = false;
  @StorageLink('xComponentName') xComponentName: string = '';
  @StorageLink('xComponentName2') xComponentName2: string = '';

  aboutToAppear() {
    testNapi.setReadyCallback((ready: boolean) => {
      hilog.info(DOMAIN, 'Index', 'xComponentReady=%{public}s', String(ready));
      if (ready) {
        const name = testNapi.GetCurrentXComponentName();
        hilog.info(DOMAIN, 'Index', 'xComponentName=%{public}s', name);
        AppStorage.setOrCreate('xComponentName', name);
      }
      AppStorage.setOrCreate('xComponentReady', ready);
    });
    testNapi.setReadyCallback2((ready: boolean) => {
      hilog.info(DOMAIN, 'Index', 'xComponentReady2=%{public}s', String(ready));
      if (ready) {
        const name = testNapi.GetCurrentXComponentName2();
        hilog.info(DOMAIN, 'Index', 'xComponentName2=%{public}s', name);
        AppStorage.setOrCreate('xComponentName2', name);
      }
      AppStorage.setOrCreate('xComponentReady2', ready);
    });
  }

  build() {
    Row() {
      Column() {
        if (this.xComponentReady) {
          XComponent({
            id: this.xComponentName,
            type: XComponentType.SURFACE,
            libraryname: 'autoeffecttest'
          })
            .width('640px')
            .height('480px')
            .onLoad(() => {
              hilog.info(DOMAIN, 'XComponent', 'onLoad surfaceReady=true');
              testNapi.notifySurfaceReady();
            })
        }
        if (this.xComponentReady2) {
          XComponent({
            id: this.xComponentName2,
            type: XComponentType.SURFACE,
            libraryname: 'autoeffecttest'
          })
            .width('640px')
            .height('480px')
            .onLoad(() => {
              hilog.info(DOMAIN, 'XComponent2', 'onLoad surfaceReady2=true');
              testNapi.notifySurfaceReady2();
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
