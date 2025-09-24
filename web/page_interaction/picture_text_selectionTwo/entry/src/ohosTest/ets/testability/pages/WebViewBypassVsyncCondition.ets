// xxx.ets
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from '../../test/Utils';
import { waitForExist} from '../../test/WaitTest.test';

const EVENT_ID_SET_SUITE_KEY = 183001;

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController();
  condition: string[] = ['WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET','WebBypassVsyncCondition.NONE'];
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State str:string = ''

  @State isPageEnd: number = -1;

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: EVENT_ID_SET_SUITE_KEY,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      console.info('valueChangeCallBack:' + JSON.stringify(eventData));
      if (eventData.data != null && eventData.data.ACTION != null) {
        this.str = eventData.data.ACTION;
        this.isReceive = 1;
      }
    }
  }

  onPageHide() {
    events_emitter.off(EVENT_ID_SET_SUITE_KEY)
  }

  build() {
    Column() {
      Button("web click").key('BypassVsyncConditionButton').onClick(async () => {
        console.info("key==>" + this.str)
        await Utils.waitForExist(()=>this.isReceive, this.str+' isReceive', 1, 1000);
        await Utils.waitForExist(()=>this.isPageEnd, this.str+' isPageEnd', 1, 1000);
        switch (this.str) {
          case "emitBypassVsyncCondition01": {
            Utils.emitEvent(this.condition[0], 183010)
            break;
          }
          case "emitBypassVsyncCondition02": {
            Utils.emitEvent(this.condition[1], 183020)
            break;
          }
        }
      })

      Web({ src: 'www.example.com', controller: this.controller })
        .bypassVsyncCondition(WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET)
        .onPageEnd((event) => {
          console.log('onPageEnd url:' + event.url);
          this.isPageEnd = 1;
        })
    }
  }
}