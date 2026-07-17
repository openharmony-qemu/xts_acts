/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

/**
 * Cover @Provider/@Consumer/@Monitor with null/undefined decorator args.
 */
@ComponentV2
struct DecoChildNullArgs {
  @Consumer(undefined) cUndef: number = 0;
  @Consumer(null) cNull: number = 0;

  build() {
    Column() {
      Text(`cUndef:${this.cUndef},cNull:${this.cNull}`)
        .id('deco_null_args_child')
        .height('5%')
    }
  }
}

@Entry
@ComponentV2
struct DecoratorNullArgsCover {
  @Provider(undefined) ageUndef: number = 1;
  @Provider(null) ageNull: number = 1;
  @Local name: string = 'Tom';
  @Local monHit: number = 0;

  @Monitor(null, null)
  onMonNull(_monitor: IMonitor): void {
    this.monHit += 1;
  }

  @Monitor(undefined, undefined)
  onMonUndef(_monitor: IMonitor): void {
    this.monHit += 1;
  }

  build() {
    Column() {
      Text('DecoratorNullArgsCover')
        .id('deco_null_args_title')
        .fontSize(16)
        .height('5%')
      Text(`ageUndef:${this.ageUndef},ageNull:${this.ageNull}`)
        .id('deco_null_args_provider')
        .height('5%')
      Text(`monHit:${this.monHit}`)
        .id('deco_null_args_monitor')
        .height('5%')
      Button('bump')
        .id('deco_null_args_btn')
        .height('5%')
        .onClick(() => {
          this.ageUndef += 1;
          this.ageNull += 1;
          this.name = 'Bob';
        })
      DecoChildNullArgs()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
