/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct BorderRadiusRenderStrategy {
  @State Render: RenderStrategy|undefined|null = 10
  @State str : string = '10'
  build() {
    NavDestination() {
      Column({ space: 2 }) {
        Row(){
          Button('NULL').onClick(() => {
            this.Render = null
            this.str = 'null'
          })
            .id('RenderStrategyNull')
            .width(60)
            .height(25)
          Button('UNDEFINED').onClick(() => {
            this.Render = undefined
            this.str = 'undefined'
          })
            .id('RenderStrategyUndefined')
            .width(85)
            .height(25)
        }
        Row(){
          Button('FAST').onClick(() => {
            this.Render  = RenderStrategy.FAST  
            this.str = this.Render.toString()
          })
            .id('RenderStrategyFast')
            .width(60)
            .height(25)
          Button('OFFSCREEN').onClick(() => {
            this.Render  = RenderStrategy.OFFSCREEN 
            this.str = this.Render.toString()
          })
            .id('RenderStrategyOffscreen')
            .width(85)
            .height(25)
        }
        Text(this.str).height(25).id('RenderStrategyText')
        Stack() {
          Column()
            .width(200)
            .height(120)
            .backgroundColor(Color.Black)
          Stack() {
            Stack(){
              Scroll(new Scroller()) {
                Image($r('app.media.icon')).width(100).height(100)
              }
              Column()
                .blur(10)
                .width(180)
                .height(100)
            }
          }
          .width(180)
          .height(100)
          .backgroundColor(Color.Pink)
          .borderRadius(50, this.Render)
          .clip(true)
        }
      }
    }
    .width('100%')
  }
}