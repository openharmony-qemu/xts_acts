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

@Entry
@Component
struct StylesVersionDecoratorPage {
  private condNum: VersionCondition = {
    minApiVersion: 12,
    maxApiVersion: 99
  };
  private condStr: VersionCondition = {
    minApiVersion: '12',
    maxApiVersion: '99'
  };
  private condUndef: VersionCondition = {};
  private condNullMin: number | string | null = null;
  private condNullMax: number | string | null = null;

  aboutToAppear(): void {
    let decoTypeOk: string = 'ok';
    try {
      let deco: StylesVersionDecorator = Styles as StylesVersionDecorator;
      decoTypeOk = (deco !== undefined) ? 'ok' : 'fail';
    } catch (e) {
      decoTypeOk = 'catch';
      console.info('StylesVersionDecorator cast error ' + e);
    }
    AppStorage.setOrCreate('styles_decorator_type', decoTypeOk);
    AppStorage.setOrCreate('styles_cond_num', JSON.stringify(this.condNum));
    AppStorage.setOrCreate('styles_cond_str', JSON.stringify(this.condStr));
    AppStorage.setOrCreate('styles_cond_undef',
      `${String(this.condUndef.minApiVersion)}|${String(this.condUndef.maxApiVersion)}`);
    AppStorage.setOrCreate('styles_cond_null',
      `${String(this.condNullMin)}|${String(this.condNullMax)}`);
    AppStorage.setOrCreate('styles_page_ready', 'ready');
  }

  build() {
    Column({ space: 8 }) {
      Text('StylesVersionDecorator')
        .id('styles_version_title')
        .fontSize(18)
      Text('plain')
        .id('styles_version_plain')
        .backgroundColor('#FF0000CC')
        .width(80)
        .height(40)
      Text(this.condNum.minApiVersion + '/' + this.condNum.maxApiVersion)
        .id('styles_version_cond_num_label')
      Text(String(this.condStr.minApiVersion) + '/' + String(this.condStr.maxApiVersion))
        .id('styles_version_cond_str_label')
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
