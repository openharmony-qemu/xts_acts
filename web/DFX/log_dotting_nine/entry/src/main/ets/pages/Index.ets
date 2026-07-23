import { hilog } from '@kit.PerformanceAnalysisKit';
import web_webview from '@ohos.web.webview'
import testNapi from 'libentry.so';
import { XtsTestServer } from 'library';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State isRegister:number = -1;
  webTag: string = 'ArkWeb1';
  controller: web_webview.WebviewController = new web_webview.WebviewController(this.webTag);
  mServer: XtsTestServer = new XtsTestServer(getContext(this), false);
  srcUrl: string = this.mServer.getAssetUrl('index.html');
  aboutToAppear() {
    this.isRegister= testNapi.nativeWebInit(this.webTag);
    console.info("aboutToAppear" + this.isRegister)
  }
  aboutToDisappear() {
    this.controller.loadUrl(this.mServer.getShutdownUrl());
  }
  build() {
    Column() {

      Row() {
        Web({ src: this.srcUrl, controller: this.controller })
          .javaScriptAccess(true)
          .fileAccess(true)
          .borderRadius(10)
      }.height('80%')
    }
  }
}
