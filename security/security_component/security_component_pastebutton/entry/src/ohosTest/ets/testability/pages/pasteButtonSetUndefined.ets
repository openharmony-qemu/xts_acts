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

import events_emitter from '@ohos.events.emitter';
import { ColorMetrics, LengthMetrics } from '@kit.ArkUI';

@Entry
@Component
struct pasteButtonSetUndefined {
  @State isShow: number = 0

  onPageShow() {
    console.info('====>page_pasteButton page show called');
  }

  onPageHide() {
    console.info('====>page_pasteButton page hide called');
  }

  build() {
    Row() {
      Column() {
        Row() {
          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .iconSize(undefined)
              .id('setUndefined0')
          }
          .visibility(this.isShow === 0 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .position(undefined)
              .id('setUndefined1')
          }
          .visibility(this.isShow === 1 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .markAnchor(undefined)
              .id('setUndefined2')
          }
          .visibility(this.isShow === 2 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .offset(undefined)
              .id('setUndefined3')
          }
          .visibility(this.isShow === 3 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontStyle(undefined)
              .id('setUndefined5')
          }
          .visibility(this.isShow === 4 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontWeight(undefined)
              .id('setUndefined6')
          }
          .visibility(this.isShow === 5 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontFamily(undefined)
              .id('setUndefined7')
          }
          .visibility(this.isShow === 6 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined8-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .fontColor(undefined)
              .id('setUndefined8-2')
          }
          .visibility(this.isShow === 7 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined9-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .iconColor(undefined)
              .id('setUndefined9-2')
          }
          .visibility(this.isShow === 8 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined10-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .backgroundColor(undefined)
              .id('setUndefined10-2')
          }
          .visibility(this.isShow === 9 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderStyle(undefined)
              .id('setUndefined11')
          }
          .visibility(this.isShow === 10 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderWidth(undefined)
              .id('setUndefined12')
          }
          .visibility(this.isShow === 11 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderColor(undefined)
              .id('setUndefined13')
          }
          .visibility(this.isShow === 12 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderRadius(undefined)
              .id('setUndefined14')
          }
          .visibility(this.isShow === 13 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .borderRadius({
                topLeft: undefined,
                topRight: undefined,
                bottomLeft: undefined,
                bottomRight: undefined,
              })
              .id('setUndefined15')
          }
          .visibility(this.isShow === 14 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .padding(undefined)
              .id('setUndefined16')
          }
          .visibility(this.isShow === 15 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .textIconSpace(undefined)
              .id('setUndefined17')
          }
          .visibility(this.isShow === 16 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined18-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .width(undefined)
              .id('setUndefined18-2')
          }
          .visibility(this.isShow === 17 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined19-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .height(undefined)
              .id('setUndefined19-2')
          }
          .visibility(this.isShow === 18 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined20-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .size(undefined)
              .id('setUndefined20-2')
          }
          .visibility(this.isShow === 19 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined21-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .constraintSize(undefined)
              .id('setUndefined21-2')
          }
          .visibility(this.isShow === 20 ? Visibility.Visible : Visibility.None)

          Column() {
              PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .align(undefined)
              .id('setUndefined22')
          }
          .visibility(this.isShow === 21 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined23-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .alignRules(undefined)
              .id('setUndefined23-2')
          }
          .visibility(this.isShow === 22 ? Visibility.Visible : Visibility.None)

          Column() {
              PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .id(undefined)
              .id('setUndefined24')
          }
          .visibility(this.isShow === 23 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined25-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .chainMode(undefined, undefined)
              .id('setUndefined25-2')
          }
          .visibility(this.isShow === 24 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined26-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .minFontScale(undefined)
              .id('setUndefined26-2')
          }
          .visibility(this.isShow === 25 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined27-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxFontScale(undefined)
              .id('setUndefined27-2')
          }
          .visibility(this.isShow === 26 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined28-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .minFontSize(undefined)
              .id('setUndefined28-2')
          }
          .visibility(this.isShow === 27 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined29-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxFontSize(undefined)
              .id('setUndefined29-2')
          }
          .visibility(this.isShow === 28 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .maxLines(undefined)
              .id('setUndefined30')
          }
          .visibility(this.isShow === 29 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .heightAdaptivePolicy(undefined)
              .id('setUndefined31')
          }
          .visibility(this.isShow === 30 ? Visibility.Visible : Visibility.None)

          Column() {
            PasteButton().id('setUndefined32-1')

            PasteButton()
              .onClick((event: ClickEvent, result: PasteButtonOnClickResult) => {
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
                  console.info('====>page_pasteButton onclick result:' + JSON.stringify(result))
                  events_emitter.emit(clickEvent, clickData)
                } catch (err) {
                  console.error('====>page_pasteButton emit action state err: ' + JSON.stringify(err.message))
                }
              })
              .focusBox(undefined)
              .id('setUndefined32-2')
          }
          .visibility(this.isShow === 31 ? Visibility.Visible : Visibility.None)

          Button('点击切换安全控件')
            .width('50%')
            .height(30)
            .offset({x:-100, y:60})
            .onClick(() => {
              this.isShow++
            })
            .id('switchButton')
        }.width(100)
      }.width('100%').alignItems(HorizontalAlign.Center)
    }.height('100%')
  }
}