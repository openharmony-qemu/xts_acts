
import { waitForExist} from '../../test/WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../test/Utils';
import { Driver, MouseButton, UiWindow, ON, On  } from '@ohos.UiTest';
import web_webview from '@ohos.web.webview';
import business_error from '@ohos.base'

@Entry
@Component
struct WebSiteIsolationMode {
  @State webviewcontroller: web_webview.WebviewController = new web_webview.WebviewController();
  controller: web_webview.WebviewController = new web_webview.WebviewController();
  @State result:number = 0;
  @State emitKey: string = '';
  @State isReceive: number = -1;
  @State isPageEnd: number = -1;
  @State url: string = '';

  onPageShow() {
    let valueChangeEvent: events_emitter.InnerEvent = {
      eventId: 162001,
      priority: events_emitter.EventPriority.LOW
    }
    events_emitter.on(valueChangeEvent, this.valueChangeCallBack)
  }

  private valueChangeCallBack = (eventData: events_emitter.EventData) => {
    if (eventData != null) {
      if (eventData.data?.ACTION != null) {
        this.emitKey = eventData.data?.ACTION;
        this.isReceive = 0;
      }
    }
  }

  build() {
    Column() {
      Row() {
        Button("web click").key('WebSiteIsolationModeButton').onClick(async () => {
          await waitForExist(()=>this.isReceive, this.emitKey, 0);
          console.info('key==>' + this.emitKey);
          this.isReceive = -1;
          switch (this.emitKey) {
            case "emitWebSiteIsolationMode001": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                  web_webview.WebviewController.setSiteIsolationMode(web_webview.SiteIsolationMode.PARTIAL);
                  Utils.emitEvent(web_webview.WebviewController.getSiteIsolationMode(), 20250920)
              } catch (error) {
                Utils.emitEvent(web_webview.SiteIsolationMode.PARTIAL, 20250920);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode002": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview.WebviewController.setSiteIsolationMode(web_webview.SiteIsolationMode.STRICT);
                Utils.emitEvent(web_webview.WebviewController.getSiteIsolationMode(), 20250921)
              } catch (error) {
                Utils.emitEvent(web_webview.SiteIsolationMode.STRICT, 20250921);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode003": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview.WebviewController.setSiteIsolationMode(web_webview.RenderProcessMode.MULTIPLE);
                Utils.emitEvent(web_webview.WebviewController.getSiteIsolationMode(), 20250922)
              } catch (error) {
                Utils.emitEvent(web_webview.RenderProcessMode.MULTIPLE, 20250922);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }
            case "emitWebSiteIsolationMode004": {
              await waitForExist(()=>this.isPageEnd, this.emitKey, 0);
              try {
                web_webview.WebviewController.setSiteIsolationMode(web_webview.RenderProcessMode.SINGLE);
                Utils.emitEvent(web_webview.WebviewController.getSiteIsolationMode(), 20250923)
              } catch (error) {
                Utils.emitEvent(web_webview.RenderProcessMode.SINGLE, 20250922);
                let e:business_error.BusinessError = error as business_error.BusinessError;
                console.error(`ErrorCode: ${e.code},  Message: ${e.message}`);
              }
              break;
            }


          }
        })
      }
      Web({ src: 'https://www.w3school.com.cn/tiy/t.asp?f=tags_iframe', controller: this.controller })
        .javaScriptAccess(true)
        .fileAccess(true)
        .onlineImageAccess(true)
        .domStorageAccess(true)
        .imageAccess(true)
        .databaseAccess(true)

    }
  }
}